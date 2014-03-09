//
//  TableViewController.m
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)reloadTheDataAndTableContents{
    _selectedIndexPath = [[NSIndexPath alloc] init];
    _nearByDineArray = [[NSMutableArray alloc] initWithObjects:@"Section 1", @"Section 2", @"Section 3", @"Section 4", @"Section 5", @"Section 6", nil];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numOfSecs = 1;
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
                numOfSecs = _nearByDineArray.count;
            }
            else {
                numOfSecs = _nearByDineArray.count;
            }
            
            break;
        }
            
        default:
            break;
    }
    return numOfSecs;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numOfRows = 1;
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
                numOfRows = 1;
            }
            else {
                numOfRows = 1;
            }
            
            break;
        }
            
        default:
            break;
    }
    return numOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int height = 1;
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
                if(_selectionIndex && indexPath.section == _selectedIndexPath.section){
                    height = 100.0;
                }
                else {
                    height = 40.0;
                }
            }
            else {
                if(_selectionIndex && indexPath.section == _selectedIndexPath.section){
                    height = 100.0;
                }
                else {
                    height = 40.0;
                }
                
            }
            
            break;
        }
            
        default:
            break;
    }
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.5;
    }
    return 0.25;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0.25;
    }
    return 0.25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"aCell";
    //[self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier andType:_typeOfTable];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(_selectionIndex && _selectedIndexPath.section == indexPath.section){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.title.text = [NSString stringWithFormat:@"%@",[_nearByDineArray objectAtIndex:indexPath.section]];
    cell.description.text = [NSString stringWithFormat:@"Test Descripton"];
    cell.description1.text = [NSString stringWithFormat:@"Test Descripton1"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            CustomTableViewCell *currentCell = (CustomTableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
            if(_selectionIndex){
                if(_selectedIndexPath.section == indexPath.section){
                    _selectionIndex = NO;
                    [self setSelectedIndexPath:indexPath];
                    currentCell.isSelected  = NO;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
                else {
                    NSIndexPath *previousIndex = [[NSIndexPath alloc] init];
                    previousIndex = _selectedIndexPath;
                    _selectionIndex = YES;
                    [self setSelectedIndexPath:indexPath];
                    currentCell.isSelected = YES;
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:indexPath.row inSection:previousIndex.section], [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section], nil] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
            }
            else {
                _selectionIndex = YES;
                [self setSelectedIndexPath:indexPath];
                currentCell.isSelected = YES;
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            break;
        }
            
        default:
            break;
    }
}

- (CustomTableViewCell *)resizeTheCellContentForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath forCell:(CustomTableViewCell *)cell {
    switch (_typeOfTable) {
        case kTableViewForNearByDines:{
            
            break;
        }
            
        default:
            break;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
