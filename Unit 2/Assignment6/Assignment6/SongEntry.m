//
//  SongEntry.m
//  Assignment6
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SongEntry.h"

@implementation SongEntry

//Setters and Getters for song related information

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


+(SongEntry*) RandomSong
{
    //data for generating randoms
    NSArray *firstSongNames = [[NSArray alloc] initWithObjects:@"Rockin",
                               @"Breaking",
                               @"High",
                               @"Sweet",
                               @"Welcome",
                               nil];
    NSArray *lastSongNames = [[NSArray alloc] initWithObjects:@"World",
                              @"Jungle",
                              @"Rules",
                              @"Voltage",
                              @"Blues",
                              nil];
    
    NSArray *firstArtistNames = [[NSArray alloc] initWithObjects:@"Jimi",
                                 @"The",
                                 @"Iggy",
                                 @"Rolling",
                                 @"Jett",
                                 @"Guns",
                                 @"Rage",
                                 nil];
    
    NSArray *lastArtistNames = [[NSArray alloc] initWithObjects:@"Hendrix",
                                @"Doors",
                                @"Popp",
                                @"Stones",
                                @"Blackhearts",
                                @"Roses",
                                @"Machine",
                                @"Clash",
                                @"Band",
                                nil];
    
    
    
    NSArray *firstAlbumNames = [[NSArray alloc] initWithObjects:@"White",
                                @"Abby",
                                @"Electric",
                                @"Evil",
                                @"Master",
                                nil];
    
    NSArray *lastAlbumNames = [[NSArray alloc] initWithObjects:@"Album",
                               @"Road",
                               @"Ladyland",
                               @"Empire",
                               @"Reality",
                               nil];
        
    //temp song variable
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
    
    //generate the album name
    NSString *albumName = [[NSString alloc] initWithFormat:@"%@ %@", [firstAlbumNames objectAtIndex:first],
                           [lastAlbumNames objectAtIndex:second]];
    [tempSongEntry setSongName:songName];
    [tempSongEntry setArtist:artistName];
    [tempSongEntry setAlbum:albumName];    
    
    return tempSongEntry;
}

@end
