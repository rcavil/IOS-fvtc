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
    _safeCombination=123;
    
    numberChoices = [[NSMutableArray alloc] init];
    for (int i=0; i<=9; i++)
    {
        [numberChoices addObject:[NSString stringWithFormat:@"%d",i]];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return _pickerColumns;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    
    return [numberChoices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [numberChoices objectAtIndex:row];

}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
    }
    
}

- (IBAction)tryButtonSelected:(UIButton *)sender {
    
    int intUserGuess=[self getUserCombinationGuess];
    NSString *strMessage;
    

    if (intUserGuess==_safeCombination)
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

- (int) getUserCombinationGuess
{
    
    return 4;
}
@end
