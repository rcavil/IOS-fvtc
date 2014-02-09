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
    //Declare local variables used for grade calculation and results
    double averageScore=0;
    
    NSString* gradeResultText;
    NSString* letterGrade;
    
    //Call local methods to get grade results
    
    averageScore=[self getAverageScore];
    
    letterGrade=[self getLetterGrade:averageScore];
    gradeResultText=[self getGradeResultText:averageScore :letterGrade];
    
    //Display grade results
    lblGradeResults.text=gradeResultText;
}

-(double) getAverageScore
{
    double averageScore=74.50;
    
    return averageScore;
}

-(NSString *) getLetterGrade:(double)gradeNumeric
{
    NSString* letterGrade;
    letterGrade=@"";
    
    if (gradeNumeric>=95)
      {
        letterGrade=@"A";
      }
    else if (gradeNumeric>=92)
      {
        letterGrade=@"A-";
      }
    else if (gradeNumeric>=90)
    {
        letterGrade=@"B+";
    }
    else if (gradeNumeric>=88)
    {
        letterGrade=@"B";
    }
    else if (gradeNumeric>=86)
    {
        letterGrade=@"B-";
    }
    else if (gradeNumeric>=83)
    {
        letterGrade=@"C+";
    }

    else if (gradeNumeric>=80)
    {
        letterGrade=@"C";
    }
    else if (gradeNumeric>=77)
    {
        letterGrade=@"C-";
    }
    else if (gradeNumeric>=75)
    {
        letterGrade=@"D+";
    }
    else if (gradeNumeric>=72)
    {
        letterGrade=@"D";
    }
    else if (gradeNumeric>=70)
    {
        letterGrade=@"D-";
    }
    else
      {
        letterGrade=@"F";
      }
    
    return letterGrade;
}

-(NSString *) getGradeResultText:(double)gradeNumeric :(NSString *)letterGrade
{
    
    
    NSString *gradeResultText = [NSString stringWithFormat:@"With an average score of %.2f, you earned a(n) %@ ", gradeNumeric,letterGrade];
    
    return gradeResultText;
}
@end
