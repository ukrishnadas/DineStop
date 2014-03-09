//
//  TableViewController.h
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConstansAndURL.h"

@interface TableViewController : UITableViewController
@property (nonatomic, assign) int typeOfTable;
@property (nonatomic, strong) NSMutableArray *nearByDineArray;
@property (nonatomic, readwrite) BOOL selectionIndex;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

- (void)reloadTheDataAndTableContents;
@end
