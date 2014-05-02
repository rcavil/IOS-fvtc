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
    NSMutableArray *_searchEntries;
    int _currentEntry;
}

+ (SearchEntryStore *) SharedStore;
- (SearchEntry *) EntryAtIndex:(NSInteger) index;

- (NSInteger) Count;
- (int) currentEntry;

- (void) AddEntry:(SearchEntry *) searchEntry   ;
- (void) RemoveEntryAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;

- (void) setCurrentEntry:(int) intCurrentEntry;
- (void) incrementCurrentEntry;
- (void) decrementCurrentEntry;

@end




