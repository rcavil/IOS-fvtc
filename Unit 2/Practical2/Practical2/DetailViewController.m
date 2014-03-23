//
//  DetailViewController.m
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import "ItemStore.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

@synthesize menuItemLabel,menuItemDescriptionLabel;

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Fill the menu item controls with the values for the passed in menu item
    
    Item * tempItem = [[ItemStore SharedStore] ItemAtIndex:_itemIndex];
    [menuItemLabel setText:[tempItem menuItem]];
    [menuItemDescriptionLabel setText:[tempItem description]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) setItemIndex:(long) index
{
    //The current array item index that was passed in from the main screen
    _itemIndex = index;
}

- (IBAction)orderItemButton:(UIButton *)sender
{
    NSLog(@"Item Ordered: %@",menuItemLabel.text);

}

- (IBAction)returnToMainMenuButton:(UIButton *)sender
{
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)IgnoreMenuItemButton:(UIButton *)sender
{
    [[ItemStore SharedStore] RemoveMenuItemAtIndex:(_itemIndex )];
    
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
    
}

@end
