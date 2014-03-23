//
//  Item.h
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
{
    NSString *_menuItem;
    NSString *_description;
}

- (void) setMenuitem:(NSString *)strMenuItem;
- (NSString *) menuItem;

- (void) setDescription:(NSString *)strDescription;
- (NSString *) description;

//Declare static method used to prefill random item values
+(Item *) RandomMenuItem;

@end
