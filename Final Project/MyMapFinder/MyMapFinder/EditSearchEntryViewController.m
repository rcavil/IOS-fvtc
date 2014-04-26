//
//  EditSearchEntryViewController.m
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "EditSearchEntryViewController.h"
#import "SearchEntry.h"
#import "SearchEntryStore.h"

@interface EditSearchEntryViewController ()

@end

@implementation EditSearchEntryViewController
@synthesize textSearchEntry;


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
    
    //Fill the entry text boxes for the entry array value that was passed in
    
    SearchEntry *tempEntry = [[SearchEntryStore SharedStore] EntryAtIndex: _searchEntryIndex];
    
    [textSearchEntry setText:[tempEntry entryName]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonSearchEntrySave:(id)sender
{
    
    //Save the search entry information from the search entry textboxes
    
    SearchEntry *tempEntry = [[SearchEntryStore SharedStore] EntryAtIndex:_searchEntryIndex];
    
    [tempEntry setEntryName:[textSearchEntry text]];
    
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
}

-(void) setSearchEntryIndex:(long) index
{
    _searchEntryIndex = index;
    
}


- (IBAction)hideKeyboard:(UITextField *)sender
  {
     [sender resignFirstResponder];
  }
@end
