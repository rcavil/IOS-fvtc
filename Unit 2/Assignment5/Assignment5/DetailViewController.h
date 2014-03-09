//
//  DetailViewController.h
//  Assignment5
//
//  Created by Ron on 3/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

//Declare Properties
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@property (weak, nonatomic) IBOutlet UITextField *songNameField;
@property (weak, nonatomic) IBOutlet UITextField *songArtistField;
@property (weak, nonatomic) IBOutlet UITextField *songAlbumField;

//Declare Actions
- (IBAction)saveButtonClick:(id)sender;

@end
