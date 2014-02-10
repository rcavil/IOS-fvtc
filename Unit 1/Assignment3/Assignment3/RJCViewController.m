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

@synthesize lblGradeResults, txtGrade1,txtGrade2,txtGrade3,txtGrade4,txtGrade5;


- (void)viewDidLoad
{
    [super viewDidLoad];
    //Allocate and initialize array to hold scores
    self.scoresArray = [[NSMutableArray alloc] init];
    
    [self.scoresArray addObject:@"0"];
    [self.scoresArray addObject:@"0"];
    [self.scoresArray addObject:@"0"];
    [self.scoresArray addObject:@"0"];
    [self.scoresArray addObject:@"0"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)hideKeyboardSetValues:(UITextField *)sender{
    
    //assign user entered grades to an array
    [self setGradeScores];

    //Hide keyboard when user exits text field
    [sender resignFirstResponder];
}

- (IBAction)btnSubmitChosen:(UIButton *)sender {
    //Declare local variables used for grade calculation and results
    double averageScore=0;
    
    NSString* gradeResultText;
    NSString* letterGrade;
    
    [self setGradeScores];
    
    //Calculate the average score for all submitted grades
    averageScore=[self getAverageScore];
    
    //Determine the letter grade from the previouslly calculated
    //average score
    letterGrade=[self getLetterGrade:averageScore];
    
    //Get the string value used to display the average score
    //and letter grade
    gradeResultText=[self getGradeResultText:averageScore :letterGrade];
    
    //Display grade results
    lblGradeResults.text=gradeResultText;
}

-(double) getAverageScore
{
    //declare local variables used for calculating the average score
    double averageScore=0.00;
    double totalPoints=0.00;

    //loop thru the array that holds the score values
    for (NSString *score in self.scoresArray)
    {
        totalPoints=totalPoints+ [score doubleValue] ;
    }

    //if not a zero value, calcualate the average score
    if (totalPoints !=0)
    {
        averageScore=(totalPoints/[self.scoresArray count]);
    }
    
    return averageScore;
}

-(NSString *) getGradeResultText:(double)gradeNumeric :(NSString *)letterGrade
{
    //declare local value that will be used to return the results string
    NSString* gradeResultText;
    
    
    if ([letterGrade hasPrefix:@"A"])
 {
        
        gradeResultText = [NSString stringWithFormat:@"With an average score of %.2f, you earned an %@ ", gradeNumeric,letterGrade];
    }
    else
    {
        gradeResultText = [NSString stringWithFormat:@"With an average score of %.2f, you earned a %@ ", gradeNumeric,letterGrade];
    
    }
    
    
    return gradeResultText;
}

-(void) setGradeScores
{
    //For every grade textbox control, store the value to a
    //corresponding array value
    
    [self.scoresArray replaceObjectAtIndex:0 withObject:txtGrade1.text];
    [self.scoresArray replaceObjectAtIndex:1 withObject:txtGrade2.text];
    [self.scoresArray replaceObjectAtIndex:2 withObject:txtGrade3.text];
    [self.scoresArray replaceObjectAtIndex:3 withObject:txtGrade4.text];
    [self.scoresArray replaceObjectAtIndex:4 withObject:txtGrade5.text];
}

-(NSString *) getLetterGrade:(double)gradeNumeric
{
    //Local variable that will hold letter grade result value
    NSString* letterGrade;
    letterGrade=@"";
    
    //Match the passed in average score against the grading
    //matrix and assign the appropriate letter grade
    //which will be returned
    
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

@end
