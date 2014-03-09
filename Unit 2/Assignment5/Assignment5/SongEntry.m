//
//  SongEntry.m
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SongEntry.h"

@implementation SongEntry

- (void) setSongName:(NSString *)strSongName
{
    _songName=strSongName;
}

- (NSString *) songName
{
    return _songName;
}

- (void) setArtist:(NSString *)strArtist

{
    _artist=strArtist;
}

- (NSString *) artist
{
    return _artist;
}

- (void) setAlbum:(NSString *)strAlbum
{
    _album=strAlbum;
}

- (NSString *) album
{
    return _album;
}

- (NSDate *) dateAdded
{
    return _dateAdded;
}

+(SongEntry*) RandomSong
{
    //data for generating randoms
    NSArray *firstSongNames = [[NSArray alloc] initWithObjects:@"Joe",
                               @"Rick",
                               @"Jon",
                               @"Carl",
                               @"Suzy",
                               nil];
    NSArray *lastSongNames = [[NSArray alloc] initWithObjects:@"Thompson",
                              @"Richards",
                              @"Stevenson",
                              @"Smith",
                              @"Jones",
                              nil];
    
    NSArray *firstArtistNames = [[NSArray alloc] initWithObjects:@"Dark",
                                 @"Liquid",
                                 @"King",
                                 @"Professor",
                                 @"Ms.",
                                 @"Mr.",
                                 @"Golden",
                                 nil];
    
    NSArray *lastArtistNames = [[NSArray alloc] initWithObjects:@"Dragon",
                                @"Robot",
                                @"Ninja",
                                @"Pirate",
                                @"Unicorn",
                                @"Volcano",
                                @"Tornado",
                                @"Earthquake",
                                @"Skeleton",
                                nil];
    
    
    
    NSArray *firstAlbumNames = [[NSArray alloc] initWithObjects:@"Super",
                                @"Cold",
                                @"Fire",
                                @"Poison",
                                @"Wind",
                                nil];
    
    NSArray *lastAlbumNames = [[NSArray alloc] initWithObjects:@"Strength",
                               @"Breath",
                               @"Skin",
                               @"Armor",
                               @"Lasers",
                               nil];
    
    
    //temp variable
    SongEntry *tempSongEntry = [[SongEntry alloc] init];
    
    //random numbers to pick
    int first = arc4random() % [firstSongNames count];
    int second = arc4random() % [lastSongNames count];
    
    //generate the song name
    NSString *songName = [[NSString alloc] initWithFormat:@"%@ %@", [firstSongNames objectAtIndex:first],
                          [lastSongNames objectAtIndex:second]];
    
    
    first = arc4random() % [firstArtistNames count];
    second = arc4random() % [lastArtistNames count];
    
    //generate the artist name
    NSString *artistName = [[NSString alloc] initWithFormat:@"%@ %@", [firstArtistNames objectAtIndex:first],
                            [lastArtistNames objectAtIndex:second]];
    
    //random numbers to pick
    
    first = arc4random() % [firstAlbumNames count];
    second = arc4random() % [lastAlbumNames count];
    
    //generate the power
    NSString *albumName = [[NSString alloc] initWithFormat:@"%@ %@", [firstAlbumNames objectAtIndex:first],
                           [lastAlbumNames objectAtIndex:second]];
    
    [tempSongEntry setSongName:songName];
    [tempSongEntry setArtist:artistName];
    [tempSongEntry setAlbum:albumName];    
    
    return tempSongEntry;
}

@end
