//
//  RJCViewController.h
//  Practical1
//
//  Created by Ron on 2/9/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController

//Action declaration to hide keyboard
//for text controls

- (IBAction)hideKeyboard:(UITextField *)sender;
- (IBAction)submitSongRequest:(id)sender;

//Property declarations for text fields
@property (weak, nonatomic) IBOutlet UITextField *txtArtist;
@property (weak, nonatomic) IBOutlet UITextField *txtSong;

//Property declaration for slider control
@property (weak, nonatomic) IBOutlet UISlider *sldVolume;

@end
