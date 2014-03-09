//
//  CustomTableViewCell.m
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andType:(kTableViewType)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setTypeOfTable:type];
        [self createCellContentForCell:self];
    }
    return self;
}
- (CustomTableViewCell *)createCellContentForCell:(CustomTableViewCell *)cell{
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                UIView *view = cell.contentView;
                
                _title= [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 200.0, 20.0)];
                _description = [[UILabel alloc] initWithFrame:CGRectMake(_title.frame.origin.x, _title.frame.origin.y+_title.frame.size.height + 10.0, 150.0 , 20.0)];
                _description1 = [[UILabel alloc] initWithFrame:CGRectMake(_title.frame.origin.x, _description.frame.origin.y+_description.frame.size.height + 10.0, 150.0 , 20.0)];
                
                [view addSubview:_title];
                [view addSubview:_description];
                [view addSubview:_description1];
            }
            else {
                UIView *view = cell.contentView;
                
                _title= [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 200.0, 20.0)];
                _description = [[UILabel alloc] initWithFrame:CGRectMake(_title.frame.origin.x, _title.frame.origin.y+_title.frame.size.height + 10.0, 150.0 , 20.0)];
                _description1 = [[UILabel alloc] initWithFrame:CGRectMake(_title.frame.origin.x, _description.frame.origin.y+_description.frame.size.height + 10.0, 150.0 , 20.0)];
                
                [view addSubview:_title];
                [view addSubview:_description];
                [view addSubview:_description1];
            }
            
            break;
        }
            
        default:
            break;
    }
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
