//
//  SongEntry.h
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongEntry : NSObject

{
    NSString *_songName;
    NSString *_artist;
    NSString *_album;
    NSDate * _dateAdded;
}

- (void) setSongName:(NSString *)strSongName;
- (NSString *) songName;

- (void) setArtist:(NSString *)strArtist;
- (NSString *) artist;

- (void) setAlbum:(NSString *)strAlbum;
- (NSString *) album;

- (NSDate *)dateAdded;


+(SongEntry *) RandomSong;

@end
