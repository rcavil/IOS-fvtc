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

@synthesize lblArtist, lblSong;

- (void)viewDidLoad
{
    [super viewDidLoad];
    lblArtist.text=@"";
    lblSong.text=@"";
    
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

@end
