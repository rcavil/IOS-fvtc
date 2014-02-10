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

//Property declarations for text fields
@property (weak, nonatomic) IBOutlet UITextField *lblArtist;
@property (weak, nonatomic) IBOutlet UITextField *lblSong;

@end
