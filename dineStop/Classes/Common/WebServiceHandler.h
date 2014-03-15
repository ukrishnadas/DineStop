//
//  WebServiceHandler.h
//  dineStop
//
//  Created by Krishna Das on 15/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstansAndURL.h"
#import "CustomActivityIndicatorView.h"

@protocol WebServiceHandlerDelegate

- (void)webServiceHandlerDidFinishLoading:(NSDictionary *)responseDictionary andAction:(kWebServiceAction)action;
- (void)webServiceHandlerDidFail:(NSError *)error andAction:(kWebServiceAction)action;

@end

@interface WebServiceHandler : NSObject
@property (nonatomic, strong) id <WebServiceHandlerDelegate> delegate;
@property (nonatomic, readwrite) kWebServiceAction currentAction;
@property (nonatomic, strong) NSMutableDictionary *postDictionary;

- (id)initWithServiceName:(kWebServiceAction)action withDelegateClass:(id)name andInput:(NSMutableDictionary *)inputDictionary;
- (void)callTheWebService;
@end
