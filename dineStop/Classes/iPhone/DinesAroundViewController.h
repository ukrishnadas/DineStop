//
//  ViewController.h
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConstansAndURL.h"
#import "TableViewController.h"
#import "WebServiceHandler.h"
#import "CustomActivityIndicatorView.h"

@interface DinesAroundViewController : UIViewController<UIGestureRecognizerDelegate, WebServiceHandlerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *nearbyDineTableView;
@property (nonatomic, strong) TableViewController *tableController;
@property (weak, nonatomic) IBOutlet UIView *leftOptionView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic, assign) __block BOOL leftViewAnimated;

@property (nonatomic, strong) WebServiceHandler *wsHandler;

- (IBAction)performLeftViewAction:(id)sender;
@end
