//
//  RJCSongEntry.m
//  Assignment5
//
//  Created by Ron on 3/2/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "RJCSongEntry.h"

@implementation RJCSongEntry


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

@end
