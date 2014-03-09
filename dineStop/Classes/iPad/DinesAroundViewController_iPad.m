//
//  DinesAroundViewController_iPad.m
//  dineStop
//
//  Created by Krishna Das on 09/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "DinesAroundViewController_iPad.h"

@interface DinesAroundViewController_iPad ()

@end

@implementation DinesAroundViewController_iPad

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_tableController = [[TableViewController alloc] init];
	[_tableController setTypeOfTable:kTableViewForNearByDines];
    [_nearbyDineTableView_iPad setDelegate:_tableController];
    [_nearbyDineTableView_iPad setDataSource:_tableController];
    [_tableController setTableView:_nearbyDineTableView_iPad];
    
    [_tableController reloadTheDataAndTableContents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
