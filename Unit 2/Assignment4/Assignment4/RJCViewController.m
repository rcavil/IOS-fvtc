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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pickerColumns=3;
    _safeStoredCombination=@"321";
    
    
    _safeUserCombination=[[NSMutableArray alloc] init];
    for (int i=0; i<=(_pickerColumns-1); i++)
    {
        [_safeUserCombination addObject:@"0"];
    }
    
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
    return _pickerColumns;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    
    return [_numberChoices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [_numberChoices objectAtIndex:row];

}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    [_safeUserCombination replaceObjectAtIndex: component withObject: [NSString stringWithFormat:@"%d",row]];
}

- (IBAction)tryButtonSelected:(UIButton *)sender {
    
    NSString *strUserGuess=[self getUserCombinationGuess];
    NSString *strMessage;
    
    
    if([strUserGuess isEqualToString:_safeStoredCombination])
    
    {
       strMessage=@"You cracked the code!";
    
    }
    else
    {
        strMessage=@"You gressed wrong, try again.";
    }
    

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Secret Safe Guess Result"
                          message:strMessage
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    
    [alert show];
    
}

- (IBAction)autoButtonSelected:(UIButton *)sender {
}

- (NSString*) getUserCombinationGuess
{
    
    NSMutableString *strUserCombination = [[NSMutableString alloc] init];
    
    for (int i=0; i<=(_pickerColumns-1); i++)
    {
        [strUserCombination appendString:  [_safeUserCombination objectAtIndex:i] ];
    }
    
    return strUserCombination;
}
@end
