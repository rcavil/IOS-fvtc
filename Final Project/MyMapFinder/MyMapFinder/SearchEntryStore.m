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
        _searchEntries = [[NSMutableArray alloc] init];
          [self setCurrentEntry:-1];
        //Add default entries

          [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"gas")]];
          [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"restaurants")]];
          [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"soccer fields")]];
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
{  //krusty
    NSLog(@"intCurrentEntry= %i",intCurrentEntry);
    //NSLog(@"_currentEntry before= %i",_currentEntry);

    _currentEntry=intCurrentEntry;
}

- (int) currentEntry
{
    return (_currentEntry);
}



- (void) incrementCurrentEntry
{
    //krusty
    
    //int currentEntryValue= [self currentEntry];
    int currentEntryValue= (_currentEntry);
    
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
    [_searchEntries addObject:searchEntry];
    [self SortSearchEntries];
}

- (SearchEntry *) EntryAtIndex:(NSInteger) index
{
    return [_searchEntries objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_searchEntries count];
}

- (void) RemoveEntryAtIndex:(NSInteger) index
{
    [_searchEntries removeObjectAtIndex:index];
    [self SortSearchEntries];
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
    BOOL success = [NSKeyedArchiver archiveRootObject:_searchEntries toFile:path];
    if (success)
    {
        NSLog(@"Saved:%@", _searchEntries);
    }
    else
    {
        NSLog(@"Problem with Save.");
    }
}

-(void) Load
{
    NSString *path = [self ItemArchivePath];
    _searchEntries = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_searchEntries)
      {
        _searchEntries = [[NSMutableArray alloc] init];
      }
}

-(void) SortSearchEntries
{
    //krusty
    //[_searchEntries sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //[_searchEntries sortUsingSelector:@selector(compare:)];
    //[_searchEntries sortUsingSelector: @selector(compare:)];
    
    //[_searchEntries sortUsingSelector:@selector(localizedCaseInsensitiveCompare: )];
}

@end
