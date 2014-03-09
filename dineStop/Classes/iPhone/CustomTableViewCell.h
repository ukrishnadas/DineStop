//
//  CustomTableViewCell.h
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConstansAndURL.h"

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, readwrite) BOOL isSelected;
@property (nonatomic, assign) int typeOfTable;

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *description;
@property (nonatomic, strong) UILabel *description1;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(kTableViewType)type;
@end
