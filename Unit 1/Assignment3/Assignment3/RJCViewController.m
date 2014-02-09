//
//  RJCViewController.m
//  Assignment3
//
//  Created by Ron on 2/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "RJCViewController.h"

@interface RJCViewController ()

@end

@implementation RJCViewController

@synthesize lblGradeResults;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideKeyboard:(UITextField *)sender {
    
    //Hide keyboard when user exits text field
    [sender resignFirstResponder];
}

- (IBAction)btnSubmitChosen:(UIButton *)sender {
    lblGradeResults.text=@"ron";
    
}

-(void) calculateAverageScore
{
    
}

-(void) calculateLetterGrade
{
    
}

@end
