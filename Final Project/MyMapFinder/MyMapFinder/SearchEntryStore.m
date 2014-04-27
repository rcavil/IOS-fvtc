//
//  SearchEntryStore.m
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SearchEntryStore.h"

@implementation SearchEntryStore

-(id) init
{
    self = [super init];
    if (self)
      {
        _searchEntry = [[NSMutableArray alloc] init];
          [self setCurrentEntry:-1];
        //Add default entries
        
          [_searchEntry addObject:[SearchEntry AddDefaultEntry:(@"soccer fields")]];
          [_searchEntry addObject:[SearchEntry AddDefaultEntry:(@"restaurants")]];
          [_searchEntry addObject:[SearchEntry AddDefaultEntry:(@"gas")]];
      }
    return self;
}

//Declare static reference to add, edit, remove entries
+ (SearchEntryStore *) SharedStore
{
    
    static SearchEntryStore *sharedStore = nil;
    if (!sharedStore)
      {
        sharedStore = [[super allocWithZone:nil] init];
      }
    return sharedStore;
}


- (void) setCurrentEntry:(int)intCurrentEntry
{
    _currentEntry=&intCurrentEntry;
}

- (int) currentEntry
{
    return *(_currentEntry);
}



- (void) incrementCurrentEntry
{
    int currentEntryValue= [self currentEntry];
    if (currentEntryValue==-1)
    {
        [self setCurrentEntry:0];
    }
    else
    {
        [self setCurrentEntry:(currentEntryValue+1)];
    }
}

- (void) decrementCurrentEntry
{

    int currentEntryValue= [self currentEntry];
    if (currentEntryValue==-1)
    {
        [self setCurrentEntry:0];
    }
    else
    {
        [self setCurrentEntry:(currentEntryValue-1)];
    }
    
}


- (void) AddEntry:(SearchEntry *)searchEntry
{
    [_searchEntry addObject:searchEntry];
}

- (SearchEntry *) EntryAtIndex:(NSInteger) index
{
    return [_searchEntry objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_searchEntry count];
}

- (void) RemoveEntryAtIndex:(NSInteger) index
{
    [_searchEntry removeObjectAtIndex:index];
}

- (NSString *) ItemArchivePath
{
    //get all the document directories
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //get the first directory returned
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    //build a unique archive for this application
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"searchentrystore.archive"];
    //write path to log
    NSLog(@"ArchivePath:%@", path);
    //return the path
    return path;
}

-(void) Save
{
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_searchEntry toFile:path];
    if (success)
    {
        NSLog(@"Saved:%@", _searchEntry);
    }
    else
    {
        NSLog(@"Problem with Save.");
    }
}

-(void) Load
{
    NSString *path = [self ItemArchivePath];
    _searchEntry = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_searchEntry)
      {
        _searchEntry = [[NSMutableArray alloc] init];
      }
}


@end
