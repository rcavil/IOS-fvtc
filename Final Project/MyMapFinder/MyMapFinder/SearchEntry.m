//
//  SearchEntry.m
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SearchEntry.h"

@implementation SearchEntry

//Setters and Getters for search entry related information

- (void) setEntryName:(NSString *)strEntryName
{
    _entryName=strEntryName;
}

- (NSString *) entryName
{
    return _entryName;
}

+(SearchEntry*) DefaultEntry
{
    //data for generating randoms
    NSArray *entryNames = [[NSArray alloc] initWithObjects:@"Bars",
                               @"Soccer Fields",
                               @"Restaurants",
                               @"Grocery Stores",
                               @"Gas",
                               nil];

    //temp entry variable
    SearchEntry *tempEntry = [[SearchEntry alloc] init];
    
    
    //random numbers to pick
    int name = arc4random() % [entryNames count];
    
    
    NSString *entryName = [[NSString alloc] initWithFormat:@"%@", [entryNames objectAtIndex:name]];
    
    [tempEntry setEntryName:entryName];
    
    return tempEntry;

}

@end
