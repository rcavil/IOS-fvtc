//
//  FTSViewController.m
//  Greeting
//
//  Created by Ron Cavil on 1/20/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "FTSViewController.h"

@interface FTSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;

@end

@implementation FTSViewController

@synthesize btnClear,btnSubmit,lblGreeting,firstNameField,lastNameField;

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Clear label
    [lblGreeting setText:@""];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClear:(id)sender {
    [self initialize];
}

- (IBAction)btnSubmit:(id)sender {
    //Set label control
    //[lblGreeting setText:@"Hello World"];
    
    NSString * firstName=[firstNameField text];
    NSString * lastName=[lastNameField text];
    
    NSString * wholeName= [[NSString alloc] initWithFormat:@"%@ %@", firstName,lastName];
    
    UIAlertView *submitAlertView = [[UIAlertView alloc] initWithTitle:@"Success" message:wholeName delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [submitAlertView show];

}
 

- (IBAction)firstNameDidEndOnExit:(id)sender {
    NSLog(@"Firing!");
}

- (IBAction)lastNameDidEndOnExit:(id)sender {
}

- (IBAction)ageSliderValueChanged:(id)sender {
    //float age = [age]
    //NSLog(@"ron");
    
    //[NSString alloc] initWithFormat:@"%i", (int) age));
}

- (IBAction)safetySwitchActionChanged:(id)sender {
    UISwitch *tempSwitch = (UISwitch *) sender;
    NSLog(@"%i",[tempSwitch isOn]);
    
    if ([tempSwitch isOn])
    {
        [firstNameField setEnabled:YES];
        [lastNameField setEnabled:YES];
        [btnSubmit setEnabled:YES];
        [btnClear setEnabled:YES];
    }
    else
    {
        [firstNameField setEnabled:NO];
        [lastNameField setEnabled:NO];
        [btnSubmit setEnabled:NO];
        [btnClear setEnabled:NO];
    }
}
- (void) initialize
    {
        //Clear label
        [lblGreeting setText:@""];
        [firstNameField setText:@""];
        [lastNameField setText:@""];
    }


    
@end
