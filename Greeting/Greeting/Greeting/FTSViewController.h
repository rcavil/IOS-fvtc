//
//  FTSViewController.h
//  Greeting
//
//  Created by Ron Cavil on 1/20/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
@property (weak, nonatomic) IBOutlet UILabel *lblGreeting;
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
- (IBAction)firstNameDidEndOnExit:(id)sender;
- (IBAction)lastNameDidEndOnExit:(id)sender;

- (IBAction)ageSliderValueChanged:(id)sender;

- (IBAction)safetySwitchActionChanged:(id)sender;

@end
