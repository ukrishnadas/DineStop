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

@interface DinesAroundViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *nearbyDineTableView;
@property (nonatomic, strong) TableViewController *tableController;

@end
