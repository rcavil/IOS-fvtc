//
//  RJCViewController.m
//  Assignment4
//
//  Created by Ron on 2/23/14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

#import "RJCViewController.h"

@interface RJCViewController ()

@end

@implementation RJCViewController

@synthesize picker;

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Hard coded safe combination for the user to guess
    _safeStoredCombination=@"987";
    
    //Set the number of picker columns for the uipickerview
    _pickerColumns=3;
    
    //Set the array that hold the user safe combination to all zeros
    _safeUserCombination=[[NSMutableArray alloc] init];
    for (int i=0; i<=(_pickerColumns-1); i++)
    {
        [_safeUserCombination addObject:@"0"];
    }

    //Populate the picker columns with the numbers 0-9
    _numberChoices = [[NSMutableArray alloc] init];
    for (int i=0; i<=9; i++)
    {
        [_numberChoices addObject:[NSString stringWithFormat:@"%d",i]];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    //Update the array that holds the users guess when a picker value is chosen
    [_safeUserCombination replaceObjectAtIndex: component withObject: [NSString stringWithFormat:@"%d",row]];
}

- (IBAction)tryButtonSelected:(UIButton *)sender {

    //Declare string values that will hold the user's guess value
    NSString *strUserGuess=[self getUserCombinationGuess];
    
    //Declare string value that will be shown to user for their guess result
    NSString *strMessage;
    
    
    //Determine if user's guess was correct
    if([strUserGuess isEqualToString:_safeStoredCombination])
    
    {
       //If guess was correct, update the message value to be shown
       strMessage=@"You cracked the code!";
    
    }
    else
    {
        //If guess was wrong, update the message value to be shown
        strMessage=@"You gressed wrong, try again.";
    }
    

    //Display alert to inform user if guess was correct or wrong
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Secret Safe Guess Result"
                          message:strMessage
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];
    
}

- (IBAction)autoButtonSelected:(UIButton *)sender
{
    //Show user what the correct value was via the uipickercontrol value

    //Loop thru the number of columns to get the individual value for each componenet
    for (int i=0; i<=(_pickerColumns-1); i++)
    {
        NSString *componentValue;
        componentValue = [_safeStoredCombination substringWithRange: NSMakeRange (i, 1)];
        
        //Set the individual uipickercontrol value to the correct value
        [picker selectRow:[componentValue integerValue] inComponent:i animated:YES];
    }
   
}

- (NSString*) getUserCombinationGuess
{
    //Return a string value of the values that the user guessed via the uipickerview control
    

    //Declare, allocate string to hold return value for the user guess value
    NSMutableString *strUserCombination = [[NSMutableString alloc] init];

    //Loop thru the array value that holds the user guess value for each component in the uipickerview
    for (int i=0; i<=(_pickerColumns-1); i++)
    {
        [strUserCombination appendString:  [_safeUserCombination objectAtIndex:i] ];
    }
    
    return strUserCombination;
}
@end
