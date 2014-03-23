//
//  Item.m
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "Item.h"

@implementation Item

//Setters and Getters for menu item related information

- (void) setMenuitem:(NSString *)strMenuItem
{
    _menuItem=strMenuItem;
}

- (NSString *) menuItem
{
    return _menuItem;
}

- (void) setDescription:(NSString *)strDescription
{
    _description=strDescription;
}

- (NSString *) description
{
    return _description;
}


+(Item*) RandomMenuItem
{
    
    NSString *strStdMenuDescription=@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

    
    //data for generating randoms
    NSArray *firstItemNames = [[NSArray alloc] initWithObjects:
                               @"Spam",
                               @"Fishhead",
                               @"Bacon",
                               @"Sirloin",
                               @"Slime",
                               nil];
    NSArray *lastItemNames = [[NSArray alloc] initWithObjects:
                              @"Casserole",
                              @"Loaf",
                              @"Stew",
                              @"Chowder",
                              @"Pasty",
                              nil];
    
    NSArray *descriptions = [[NSArray alloc] initWithObjects:
                             strStdMenuDescription,
                             strStdMenuDescription,
                             strStdMenuDescription,
                             strStdMenuDescription,
                             strStdMenuDescription,
                                 nil];
    
    //temp item variable
    Item *tempItem = [[Item alloc] init];
    
    //random numbers to pick
    int first = arc4random() % [firstItemNames count];
    int second = arc4random() % [lastItemNames count];
    
    //generate the menu item name
    NSString *itemName = [[NSString alloc] initWithFormat:@"%@ %@", [firstItemNames objectAtIndex:first],
                          [lastItemNames objectAtIndex:second]];
    
    first = arc4random() % [descriptions count];
    
    //generate the menu item description
    NSString *itemDescription = [[NSString alloc] initWithFormat:@"%@", [descriptions objectAtIndex:first]];
    
    [tempItem setMenuitem:itemName];
    [tempItem setDescription:itemDescription];
    
    
    return tempItem;
}


@end
