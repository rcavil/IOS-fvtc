//
//  DetailViewController.h
//  Practical2
//
//  Created by Ron on 3/23/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

{
    long _itemIndex;
}

//Declare Properties
@property (weak, nonatomic) IBOutlet UILabel *menuItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *menuItemDescriptionLabel;

//Declare Actions
- (IBAction)orderItemButton:(UIButton *)sender;
- (IBAction)returnToMainMenuButton:(UIButton *)sender;
- (IBAction)IgnoreMenuItemButton:(UIButton *)sender;

//Declare Methods

-(void) setItemIndex:(long) index;

@end
