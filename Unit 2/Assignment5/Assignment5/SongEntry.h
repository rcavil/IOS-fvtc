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
    //Declare song attributes
    
    NSString *_songName;
    NSString *_artist;
    NSString *_album;
}

//Declare song getters and setters

- (void) setSongName:(NSString *)strSongName;
- (NSString *) songName;

- (void) setArtist:(NSString *)strArtist;
- (NSString *) artist;

- (void) setAlbum:(NSString *)strAlbum;
- (NSString *) album;

//Declare static method used to prefill random song values
+(SongEntry *) RandomSong;

@end
