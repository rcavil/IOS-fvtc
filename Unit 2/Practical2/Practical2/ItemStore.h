//
//  ItemStore.h
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

//central location to store, retrieve informaton on menu items

@interface ItemStore : NSObject
{
    NSMutableArray *_menuItems;
}

+ (ItemStore *) SharedStore;
- (void) AddMenuItem:(Item *) item;
- (void) RemoveMenuItemAtIndex:(NSInteger) index;
- (Item *) ItemAtIndex:(NSInteger) index;
- (NSInteger) Count;

@end
