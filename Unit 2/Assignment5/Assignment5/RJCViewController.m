//
//  RJCViewController.m
//  Assignment5
//
//  Created by Ron on 3/2/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "RJCViewController.h"

@interface RJCViewController ()

@end

@implementation RJCViewController

@synthesize picker;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set the number of picker columns for the uipickerview
    _pickerColumns=1;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)deleteSong:(id)sender {
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    //Return the number of columns in the uipickerview control
    return _pickerColumns;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView

numberOfRowsInComponent:(NSInteger)component
{
    //Return the number of components in the uipickerview control
    return [_numberChoices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    //Return the value of the uipickerview control chosen
    return [_numberChoices objectAtIndex:row];
}

@end
