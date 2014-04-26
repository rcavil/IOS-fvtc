//
//  SearchEntry.h
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchEntry : NSObject

{
    NSString *_entryName;
}

- (void) setEntryName:(NSString *)strEntryName;

- (NSString *) entryName;


//Declare static method used to prefill random entry values
+(SearchEntry *) DefaultEntry;


@end
