//
//  SearchEntryStore.m
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "SearchEntryStore.h"
#import "AppDelegate.h"

@implementation SearchEntryStore

-(id) init
{
    self = [super init];
    if (self)
      {
        _searchEntries = [[NSMutableArray alloc] init];
       [self setCurrentEntry:-1];
       [self addDefaultEntries];
       [self loadCoreData];
          
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


- (void) addDefaultEntries
{
    /*krusty
    [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"gas")]];
    [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"lodging")]];
    [_searchEntries addObject:[SearchEntry AddDefaultEntry:(@"restaurants")]];
    */
    
    [self clearAllEntries];

    
    
    [self saveCoreData:@"gas"];
    [self saveCoreData:@"lodging"];
    [self saveCoreData:@"restaurants"];
}

- (void) setCurrentEntry:(NSInteger)intCurrentEntry
{
    _currentEntry=intCurrentEntry;
}

- (NSInteger) currentEntry
{
    return (_currentEntry);
}



- (void) incrementCurrentEntry
{
    
    NSInteger numberOfEntries= [self Count];
    NSInteger currentEntryValue= (_currentEntry);
    
    if (currentEntryValue==(numberOfEntries-1))
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
    NSInteger numberOfEntries= [self Count];
    NSInteger currentEntryValue= [self currentEntry];
    
    if (currentEntryValue==-1)
    {
        [self setCurrentEntry:0];
    }
    else if (currentEntryValue==0)
    {
        [self setCurrentEntry:(numberOfEntries-1)];
    }
    else
    {
        [self setCurrentEntry:(currentEntryValue-1)];
    }
    
}


- (void) addEntry:(SearchEntry *)searchEntry
{
    [_searchEntries addObject:searchEntry];
}

- (SearchEntry *) EntryAtIndex:(NSInteger) index
{
    return [_searchEntries objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_searchEntries count];
}

- (void) removeEntryAtIndex:(NSInteger) index
{
    [_searchEntries removeObjectAtIndex:index];
}

- (BOOL) searchEntryExists: (NSString*) searchEntry
{
    bool entryExists = false;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"entryName like[c] %@",searchEntry];    
    
    NSArray *results = [_searchEntries filteredArrayUsingPredicate:predicate];
    if ([results count]>0)
    {
        entryExists=true;
    }
    
    return entryExists;
}


- (NSString *) itemArchivePath
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

-(void) saveCoreData:(NSString*) searchEntry
{
   //krusty Need to save coredata
    /*
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
    */
    
    //Begin core data changes
    
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[appDelegate managedObjectContext];
    
    NSManagedObject *newSearchEntry;

    
    newSearchEntry = [NSEntityDescription
                  insertNewObjectForEntityForName:@"MapSearchEntries"
                  inManagedObjectContext:context];
    
    [newSearchEntry setValue: searchEntry forKey:@"entryName"];
    NSError *error;
    [context save:&error];
    
}

-(void) loadCoreData
{
    //krusty need to load from coredata
    /*
    NSString *path = [self ItemArchivePath];
    _searchEntries = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_searchEntries)
      {
        _searchEntries = [[NSMutableArray alloc] init];
      }
     */
    
    NSError *error;
    
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[appDelegate managedObjectContext];
 
    

    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"MapSearchEntries" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects)
    {
        //krusty NSLog(@"EntryName: %@", [info valueForKey:@"entryName"]);
        [_searchEntries addObject:[SearchEntry AddDefaultEntry:([info valueForKey:@"entryName"])]];
    }
    
    
}


- (void) clearAllEntries
{
    AppDelegate *appDelegate =[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context =[appDelegate managedObjectContext];

    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MapSearchEntries" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    fetchRequest = nil;
    
    for (NSManagedObject *info in fetchedObjects)
    {
        [context deleteObject:info];
        
    }

    if (![context save:&error])
    {
    }
    
}

-(void) sortSearchEntries
{
    
    NSSortDescriptor* sortByName = [NSSortDescriptor sortDescriptorWithKey:@"entryName" ascending:YES];
    [_searchEntries sortUsingDescriptors:[NSArray arrayWithObject:sortByName]];
    
}

@end
