//  SongStore.h
//  Assignment6
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongEntry.h"

//Used to be the central location to add, edit, remove song entries
@interface SongStore : NSObject

{
    NSMutableArray *_songs;
}

+ (SongStore *) SharedStore;
- (void) AddSongEntry:(SongEntry *) song;
- (SongEntry *) SongAtIndex:(NSInteger) index;
- (NSInteger) Count;
- (void) RemoveSongAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;



@end
