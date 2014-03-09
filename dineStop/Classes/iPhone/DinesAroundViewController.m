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
    _tableController = [[TableViewController alloc] init];
	[_tableController setTypeOfTable:kTableViewForNearByDines];
    [_nearbyDineTableView setDelegate:_tableController];
    [_nearbyDineTableView setDataSource:_tableController];
    [_tableController setTableView:_nearbyDineTableView];
    
    [_tableController reloadTheDataAndTableContents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
