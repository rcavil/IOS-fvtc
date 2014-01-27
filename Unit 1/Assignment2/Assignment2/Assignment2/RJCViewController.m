//
//  RJCViewController.m
//  Assignment2
//
//  Created by Ron on 1/25/14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

#import "RJCViewController.h"

@interface RJCViewController ()

@end

@implementation RJCViewController

@synthesize lblAgeValue,sldAgeValue,btnSubmit,swtReadyToSubmit,txtFirstName,txtLastName;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)sldAgeValueChanged:(UISlider *)sender {
    
    lblAgeValue.text=[@((int)sender.value) stringValue];
    
}
- (IBAction)swtReadyToSubmit:(UISwitch *)sender {

    //If Submit Switch On, user is then allowed to submit survey
    
    if (swtReadyToSubmit.on)
    {
        btnSubmit.enabled=true;
    }
    else
    {
        btnSubmit.enabled=false;
    }
    
}



- (IBAction)hideKeyboard:(UITextField *)sender
   {
      //Hide keyboard when user exits text field
      [sender resignFirstResponder];
    }


- (IBAction)btnSubmitChosen:(id)sender {

    //Write entry to log and display message when survey submitted
    
    NSLog(@"Submit button has been chosen!");
    
    UIAlertView *message = [[UIAlertView alloc]
                            initWithTitle:@"Success"
                             message:@"Thanks for your submission!"
                             delegate:nil
                             cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
    [message show];
}



@end
