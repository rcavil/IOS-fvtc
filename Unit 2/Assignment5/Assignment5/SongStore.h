//  SongStore.h
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongEntry.h"

//Used to be the central location to add, edit, remove song entries
@interface SongStore : NSObject

{
    //Array to hold all song values
    NSMutableArray *_songs;
}

//Declare static reference to shared store
+ (SongStore *) SharedStore;

//Declare fields used by this class
- (NSInteger) Count;
- (SongEntry *) SongAtIndex:(NSInteger) index;

//Declare methods used by this class
- (void) AddSongEntry:(SongEntry *) song;
- (void) RemoveSongAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;

@end
