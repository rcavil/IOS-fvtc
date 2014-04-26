//
//  SearchEntryStore.h
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchEntry.h"

@interface SearchEntryStore : NSObject

{
    NSMutableArray *_searchEntry;
}

+ (SearchEntryStore *) SharedStore;
- (void) AddEntry:(SearchEntry *) searchEntry   ;
- (SearchEntry *) EntryAtIndex:(NSInteger) index;
- (NSInteger) Count;
- (void) RemoveEntryAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;
@end
