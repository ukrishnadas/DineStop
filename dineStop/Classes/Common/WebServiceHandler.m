//
//  WebServiceHandler.m
//  dineStop
//
//  Created by Krishna Das on 15/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "WebServiceHandler.h"

@implementation WebServiceHandler

- (id)initWithServiceName:(kWebServiceAction)action withDelegateClass:(id)name andInput:(NSMutableDictionary *)inputDictionary {
    _currentAction = action;
    _delegate = name;
    _postDictionary = inputDictionary;
    
    return self;
}

- (void)callTheWebService{
    
    NSString *prepareURL;
    NSMutableURLRequest *request;
    
    switch (_currentAction) {
        case kWebServiceFSVenuesAction:{
            prepareURL = [NSString stringWithFormat:@"%@?ll=%@,%@&client_id=%@&client_secret=%@&v=20140315",kFSVenuesURL, @"13.0861", @"80.2791",kFSClientID, kFSClientSecret];
            request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:prepareURL]];
            [request setHTTPMethod:@"GET"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            break;
        }
        case kWebServiceFSCategoriesAction:{
            NSError *errorParse = nil;
            NSData *jsonData;
            if(_postDictionary && _postDictionary.count)
                jsonData = [NSJSONSerialization dataWithJSONObject:_postDictionary options:0 error:&errorParse];
            if(!errorParse)
            {
                prepareURL = [NSString stringWithFormat:@"%@?ll=%@,%@&client_id=%@&client_secret=%@",kFSVenuesURL, @"13.0861", @"80.2791",kFSClientID, kFSClientSecret];
                request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:prepareURL]];
                [request setHTTPMethod:@"POST"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                [request setValue:[NSString stringWithFormat:@"%d", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
                [request setHTTPBody:jsonData];
            }
            else {
                [_delegate webServiceHandlerDidFail:errorParse andAction:_currentAction];
            }
            
            break;
        }
            
        default:
            break;
    }
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *responseData , NSError *error) {
            
            if(!error)
            {
                NSError *errorParse = nil;
                NSDictionary *responseDic =  [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&errorParse];
                
                if(!errorParse)
                {
                    NSLog(@"RESPONCE DICTIONARY -- %d - %@",responseDic.count, responseDic);
                    if(responseDic.count)
                    {
                        dispatch_async(dispatch_get_main_queue(),
                                       ^{
                                           [_delegate webServiceHandlerDidFinishLoading:responseDic andAction:_currentAction];
                                       });
                        
                    }else {
                        dispatch_async(dispatch_get_main_queue(),
                                       ^{
                                           NSError *err = [NSError errorWithDomain:prepareURL code:100 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Input Parsing Error", @"loaclizedDescription", nil]];
                                           [_delegate webServiceHandlerDidFail:err andAction:_currentAction];
                                       });
                    }
                    
                }
                else
                {
                    NSLog(@"JSON PARSING ERROR __ CHECK WEB SERVICE CALL OR RESPONCE");
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                       [_delegate webServiceHandlerDidFail:errorParse andAction:_currentAction];
                                   });
                }
            }
            else
            {
                NSLog(@"ERROR RESPONCE RECEIVED ON CALLING WEB SERVICE");
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   [_delegate webServiceHandlerDidFail:error andAction:_currentAction];
                               });
            }
            
            
    }];
    
}

@end
