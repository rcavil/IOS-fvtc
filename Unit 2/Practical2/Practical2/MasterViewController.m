//
//  MasterViewController.m
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ItemStore.h"

@interface MasterViewController ()
{
    //Array to hold entries for the table view
    NSMutableArray *_menuItems;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void) viewDidAppear:(BOOL)animated
{
    [[self tableView] reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //The table view will contain as many entries as the SharedStore does
    return [[ItemStore SharedStore] Count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Item *tempItem = [[ItemStore SharedStore] ItemAtIndex:[indexPath row]];
    
    //Display the menu items in the view
    NSString *display = [[NSString alloc] initWithFormat:@"%@", [tempItem menuItem]];
    [[cell textLabel] setText:display];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //Lauch item detail screen because it was chosen
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setItemIndex:[indexPath row]];
    }
    
}

@end
