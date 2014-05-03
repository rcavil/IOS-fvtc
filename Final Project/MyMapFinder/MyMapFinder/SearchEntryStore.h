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
    NSInteger _currentEntry;
}

+ (SearchEntryStore *) SharedStore;
- (SearchEntry *) EntryAtIndex:(NSInteger) index;

- (NSInteger) Count;
- (NSInteger) currentEntry;

- (void) AddEntry:(SearchEntry *) searchEntry   ;
- (void) RemoveEntryAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;
- (BOOL) SearchEntryExists: (NSString*) searchEntry;

- (void) setCurrentEntry:(NSInteger) intCurrentEntry;
- (void) incrementCurrentEntry;
- (void) decrementCurrentEntry;

@end




