//
//  DinesAroundViewController_iPad.h
//  dineStop
//
//  Created by Krishna Das on 09/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConstansAndURL.h"
#import "TableViewController.h"

@interface DinesAroundViewController_iPad : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *nearbyDineTableView_iPad;
@property (nonatomic, strong) TableViewController *tableController;
@end
