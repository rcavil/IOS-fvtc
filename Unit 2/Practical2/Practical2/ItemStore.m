//
//  ItemStore.m
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "ItemStore.h"

@implementation ItemStore

-(id) init
{
    self = [super init];
    if (self) {
        _menuItems = [[NSMutableArray alloc] init];
        
        //Add random default menu entries
        
        for (int i = 1; i <= 4; i++)
        {
            [_menuItems addObject:[Item RandomMenuItem]];
        }
        
    }
    return self;
}


//Declare static reference to add, retrieve menu items
+ (ItemStore *) SharedStore
{
    
    static ItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (void) AddMenuItem:(Item *)item
{
    [_menuItems addObject:item];
}

- (Item *) ItemAtIndex:(NSInteger) index
{
    return [_menuItems objectAtIndex:index];
}

- (void) RemoveMenuItemAtIndex:(NSInteger) index
{
    [_menuItems removeObjectAtIndex:index];
}


- (NSInteger) Count
{
    return [_menuItems count];
}


@end
