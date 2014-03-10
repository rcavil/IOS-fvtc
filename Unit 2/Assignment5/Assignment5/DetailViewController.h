//
//  DetailViewController.h
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    int _songIndex;
    
}

//Declare Properties

@property (weak, nonatomic) IBOutlet UITextField *songNameField;
@property (weak, nonatomic) IBOutlet UITextField *songArtistField;
@property (weak, nonatomic) IBOutlet UITextField *songAlbumField;

//Declare Methods
-(void) setSongIndex:(NSInteger) index;

//Declare Actions
- (IBAction)saveButtonClick:(id)sender;
- (IBAction)hideKeyboard:(UITextField *)sender;

@end
