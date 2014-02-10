//
//  RJCViewController.m
//  Practical1
//
//  Created by Ron on 2/9/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "RJCViewController.h"

@interface RJCViewController ()

@end

@implementation RJCViewController

@synthesize txtArtist, txtSong, sldVolume;

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Clear out user control values
    
    txtArtist.text=@"";
    txtSong.text=@"";
    sldVolume.value=0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)hideKeyboard:(UITextField *)sender
  {
    //Hide keyboard when user exits text field
    [sender resignFirstResponder];
  }

- (IBAction)submitSongRequest:(id)sender {
    //Log user song request via NSLog
    
    NSLog(@"Song Artist: %@, Song Title: %@, Volume: %.0f",txtArtist.text,txtSong.text,sldVolume.value);
}
@end
