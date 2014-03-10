//
//  SongStore.m
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SongStore.h"

@implementation SongStore

-(id) init
{
    self = [super init];
    if (self) {
        _songs = [[NSMutableArray alloc] init];
        
        //Add 3 randonm default song entries
        
        [_songs addObject:[SongEntry RandomSong]];
        [_songs addObject:[SongEntry RandomSong]];
        [_songs addObject:[SongEntry RandomSong]];
        
    }
    return self;
}

//Declare static reference to add, edit, remove song entries
+ (SongStore *) SharedStore
{
    
    static SongStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (void) AddSongEntry:(SongEntry *)song
{
    [_songs addObject:song];
}

- (SongEntry *) SongAtIndex:(NSInteger) index
{
    return [_songs objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_songs count];
}

- (void) RemoveSongAtIndex:(NSInteger) index
{
    [_songs removeObjectAtIndex:index];
}

- (NSString *) ItemArchivePath
{
    //get all the document directories
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //get the first directory returned
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    //build a unique archive for this application
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"songstore.archive"];
    //write path to log
    NSLog(@"ArchivePath:%@", path);
    //return the path
    return path;
}

-(void) Save
{
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_songs toFile:path];
    if (success) {
        NSLog(@"Saved:%@", _songs);
    }
    else
    {
        NSLog(@"Problem with Save.");
    }
}

-(void) Load
{
    NSString *path = [self ItemArchivePath];
    _songs = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_songs) {
        _songs = [[NSMutableArray alloc] init];
    }
}


@end
