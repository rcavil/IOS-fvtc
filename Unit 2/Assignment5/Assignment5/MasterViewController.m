//
//  MasterViewController.m
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SongStore.h"

@interface MasterViewController () {
    NSMutableArray *_songs;
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
    
    //Create an add button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    //Create left swipe gesture to delete songs
    UISwipeGestureRecognizer *gestureLeft;
    gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self tableView] addGestureRecognizer:gestureLeft];
    
}

-(void) handleSwipeFrom:(UISwipeGestureRecognizer *) sender
{
    NSLog(@"Swiped");
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        //functionality to remove current item due to swipe gesture
        CGPoint swipeLocation = [sender locationInView:[self tableView]];
        NSIndexPath *indexPath = [[self tableView] indexPathForRowAtPoint:swipeLocation];
        
        NSLog(@"Indexpath Row:%i||Section:%i", [indexPath row], [indexPath section]);
        NSLog(@"Count:%i", [[SongStore SharedStore] Count] );
        if (indexPath != nil && [indexPath row] < [[SongStore SharedStore] Count] )
        {
            [[self tableView] beginUpdates];
            [[self tableView] deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil]
                                    withRowAnimation:UITableViewRowAnimationLeft];
            
            [[SongStore SharedStore] RemoveSongAtIndex:[indexPath row]];
            [[self tableView] endUpdates];
        }
    }
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)insertNewObject:(id)sender
{
    
    //temp song variable that will be use to create a new song entry
    SongEntry *tempSongEntry = [[SongEntry alloc] init];
    [tempSongEntry setSongName:@""];
    [tempSongEntry setArtist:@""];
    [tempSongEntry setAlbum:@""];

    //Add new songe entry via Shared Store
    [[SongStore SharedStore] AddSongEntry: tempSongEntry];
    
    //Get count of total soungs.  Minus 1 due to zero bassed array
    NSInteger songColumn=[[SongStore SharedStore] Count]-1;

    //Lauch the detail song screen
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"showDetail"];
    [detail setSongIndex:songColumn];
    [self.navigationController pushViewController: detail animated: YES];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SongStore SharedStore] Count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    SongEntry *tempSong = [[SongStore SharedStore] SongAtIndex:[indexPath row]];
    
    //Display the Song name, song artist in the table view
    NSString *display = [[NSString alloc] initWithFormat:@"%@: %@", [tempSong songName], [tempSong artist]];
    [[cell textLabel] setText:display];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Lauch song detail screen because it was chosen
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setSongIndex:[indexPath row]];
    }
}

@end
