//
//  DetailViewController.m
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "DetailViewController.h"
#import "SongEntry.h"
#import "SongStore.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

@ synthesize songNameField, songArtistField,songAlbumField;

-(id) init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}


#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //Fill the song text boxes for the song array value that was passed in
    
    SongEntry *tempSong = [[SongStore SharedStore] SongAtIndex: _songIndex];
    
    [songNameField setText:[tempSong songName]];
    [songArtistField setText: [tempSong artist]];
    [songAlbumField setText: [tempSong album]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)saveButtonClick:(id)sender {
    
    //Save the song information from the song textboxes
    
    SongEntry *tempSong = [[SongStore SharedStore] SongAtIndex:_songIndex];
    
    [tempSong setSongName:[songNameField text]];
    [tempSong setArtist:[songArtistField text]];
    [tempSong setAlbum:[songAlbumField text]];
    
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
    
}

-(void) setSongIndex:(long) index
{
    _songIndex = index;
    
}

- (IBAction)hideKeyboard:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
