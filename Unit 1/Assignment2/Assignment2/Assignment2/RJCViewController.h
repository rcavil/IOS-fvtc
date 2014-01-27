//
//  RJCViewController.h
//  Assignment2
//
//  Created by Ron on 1/25/14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController

//Properties declared

@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;

@property (weak, nonatomic) IBOutlet UISwitch *swtReadyToSubmit;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UISlider *sldAgeValue;
@property (weak, nonatomic) IBOutlet UILabel *lblAgeValue;


//Actions declared

- (IBAction)hideKeyboard:(UITextField *)sender;

- (IBAction)btnSubmitChosen:(id)sender;
- (IBAction)swtReadyToSubmit:(UISwitch *)sender;
- (IBAction)sldAgeValueChanged:(UISlider *)sender;

@end
