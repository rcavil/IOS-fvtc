//
//  DetailViewController.m
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
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

/*KRUSTY
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [songNameField resignFirstResponder];
    [songArtistField resignFirstResponder];
    [songAlbumField resignFirstResponder];
}
KRUSTY */
 

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonClick:(id)sender {
}
@end
