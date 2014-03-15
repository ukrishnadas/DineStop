//
//  ViewController.m
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "DinesAroundViewController.h"

@interface DinesAroundViewController ()

@end

@implementation DinesAroundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _wsHandler = [[WebServiceHandler alloc] initWithServiceName:kWebServiceFSVenuesAction withDelegateClass:self andInput:nil];
    [[CustomActivityIndicatorView sharedManager] showActivityIndicator:self.view];
    [_wsHandler callTheWebService];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftOrRightSwipeAction:)];
    [rightSwipe setDelegate:self];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftOrRightSwipeAction:)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [leftSwipe setDelegate:self];
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    
    _tableController = [[TableViewController alloc] init];
	[_tableController setTypeOfTable:kTableViewForNearByDines];
    [_nearbyDineTableView setDelegate:_tableController];
    [_nearbyDineTableView setDataSource:_tableController];
    [_tableController setTableView:_nearbyDineTableView];
    
    [_tableController reloadTheDataAndTableContents];
}

- (void)leftOrRightSwipeAction:(UISwipeGestureRecognizer *)gesture {
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"right swipe found");
        [self bringTheLeftOptionsView:YES];
    }
    else if(gesture.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"left swipe found");
        [self bringTheLeftOptionsView:NO];
    }
}

- (void)bringTheLeftOptionsView:(BOOL)val {
    if(val){
        if(!_leftViewAnimated){
            [UIView animateWithDuration:0.2 animations:^{
                [_leftOptionView setFrame:CGRectMake(_leftOptionView.frame.origin.x+_leftOptionView.frame.size.width, _leftOptionView.frame.origin.y, _leftOptionView.frame.size.width, _leftOptionView.frame.size.height)];
                [_mainView setFrame:CGRectMake(_mainView.frame.origin.x+_leftOptionView.frame.size.width, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height)];
                
            }completion:^(BOOL finished){
                NSLog(@"Done Animation");
                _leftViewAnimated = YES;
            }];
        }
    }
    else {
        if(_leftViewAnimated){
            [UIView animateWithDuration:0.2 animations:^{
                [_leftOptionView setFrame:CGRectMake(_leftOptionView.frame.origin.x-_leftOptionView.frame.size.width, _leftOptionView.frame.origin.y, _leftOptionView.frame.size.width, _leftOptionView.frame.size.height)];
                [_mainView setFrame:CGRectMake(_mainView.frame.origin.x-_leftOptionView.frame.size.width, _mainView.frame.origin.y, _mainView.frame.size.width, _mainView.frame.size.height)];
                
            }completion:^(BOOL finished){
                NSLog(@"Done Animation");
                _leftViewAnimated = NO;
            }];
        }
    }
}

#pragma mark Gesture Delegates

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)performLeftViewAction:(id)sender {
    [self bringTheLeftOptionsView:!_leftViewAnimated];
}


#pragma mark Webservice Delegate
- (void)webServiceHandlerDidFinishLoading:(NSDictionary *)responseDictionary andAction:(kWebServiceAction)action{
        [[CustomActivityIndicatorView sharedManager] hideActivityIndicator];
}
- (void)webServiceHandlerDidFail:(NSError *)error andAction:(kWebServiceAction)action{
        [[CustomActivityIndicatorView sharedManager] hideActivityIndicator];    
}

@end
