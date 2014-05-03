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
    [textSearchEntry becomeFirstResponder];
    
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

- (IBAction)buttonSearchEntrySave:(UIButton *)sender
{
    NSString *origEntryName =[textSearchEntry text];
    NSString *newEntryName = [origEntryName lowercaseString];
    
    if (newEntryName.length==0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New search entry is blank"
                                                        message:@"Add cancelled."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [textSearchEntry becomeFirstResponder];
        
    }
    else
    {
      //See if new entry already exists
      BOOL newEntryExists=[[SearchEntryStore SharedStore] SearchEntryExists:(newEntryName)];
    
      if (newEntryExists==false)
      {
          //Save the search entry information from the search entry textboxes
        
          SearchEntry *tempEntry = [[SearchEntryStore SharedStore] EntryAtIndex:_searchEntryIndex];
          [tempEntry setEntryName:newEntryName];
 
          //dismisses the current view
          [[self navigationController] popViewControllerAnimated:YES];
      }
      else
      {
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New search entry already exists"
                                                          message:@"Add cancelled."
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
          [alert show];
          [textSearchEntry becomeFirstResponder];
      }
    }
 
}

-(void) setSearchEntryIndex:(NSInteger) index
{
    _searchEntryIndex = index;
    
}


- (IBAction)hideKeyboard:(UITextField *)sender
  {
     [sender resignFirstResponder];
  }

- (IBAction)buttonSearchEntryCancel:(UIButton *)sender
{
    [[SearchEntryStore SharedStore] RemoveEntryAtIndex:_searchEntryIndex];
    
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
}
@end
