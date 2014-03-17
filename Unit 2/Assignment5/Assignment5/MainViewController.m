//
//  MainViewController.m
//  Assignment5
//
//  Created by Ron on 3/16/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "SongStore.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    NSMutableArray *_songs;
}


@synthesize picker;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set the number of picker columns for the uipickerview
    _pickerColumns=1;
    
    NSInteger songEntries=[self numberOfSongs];
    
    //Populate the picker columns with the song entries in the array
    
    _songs  = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<=songEntries; i++)
    {
        SongEntry *tempSong = [[SongStore SharedStore] SongAtIndex:i];
        NSString *obj = [tempSong songName];
        [_songs addObject:obj];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    //Return the number of columns in the uipickerview control
    return _pickerColumns;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView

numberOfRowsInComponent:(NSInteger)component
{
    //Return the number of components in the uipickerview control
    return [[SongStore SharedStore] Count];

}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    //Return the value of the uipickerview control chosen
    return [_songs objectAtIndex:row];

}


- (NSInteger)numberOfSongs
{
    return [[SongStore SharedStore] Count]-1;
}


- (IBAction)buttonAddSong:(UIButton *)sender {
    //temp song variable that will be use to create a new song entry
    SongEntry *tempSongEntry = [[SongEntry alloc] init];
    [tempSongEntry setSongName:@""];
    [tempSongEntry setArtist:@""];
    [tempSongEntry setAlbum:@""];
    
    //Add new songe entry via Shared Store
    [[SongStore SharedStore] AddSongEntry: tempSongEntry];

    //Get count of total songs.
    NSInteger songNumber=[self numberOfSongs];
    
    //Launch the detail song screen
    [self launchSongDetailScreen:songNumber];
    
  }

- (IBAction)buttonEditSong:(UIButton *)sender
{
    NSInteger songNumber=[self numberOfSongs];
    
    //Launch the detail song screen
    [self launchSongDetailScreen:songNumber];
}

- (IBAction)buttonDeleteSong:(UIButton *)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Lauch song detail screen because it was chosen
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSInteger songEntries=[self numberOfSongs];
        [[segue destinationViewController] setSongIndex:songEntries];
    }
}

- (void)launchSongDetailScreen:(NSInteger) songEntry
{
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"showDetail"];

    [detail setSongIndex:songEntry];
    
    [self presentViewController:detail animated:YES completion:nil];

}

@end
