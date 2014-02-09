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

//NSMutableArray *scoresArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    // Dispose of any resources that can be recreated.
}


- (IBAction)hideKeyboard:(UITextField *)sender {
    
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
    
    //Call local methods to get grade results
    
    averageScore=[self getAverageScore];
    
    letterGrade=[self getLetterGrade:averageScore];
    gradeResultText=[self getGradeResultText:averageScore :letterGrade];
    
    //Display grade results
    lblGradeResults.text=gradeResultText;
}

-(double) getAverageScore
{
    double averageScore=0.00;
    double totalPoints=0.00;
    //[*scoresArray[0] doubleValue];

    for (NSString *score in self.scoresArray)
    {
        totalPoints=totalPoints+ [score doubleValue] ;
    }

    if (totalPoints !=0)
    {
        averageScore=(totalPoints/5);
    }
    
    return averageScore;
}

-(NSString *) getGradeResultText:(double)gradeNumeric :(NSString *)letterGrade
{
    
    NSString *gradeResultText = [NSString stringWithFormat:@"With an average score of %.2f, you earned a %@ ", gradeNumeric,letterGrade];
    
    return gradeResultText;
}

-(void) setGradeScores
{
 
    [self.scoresArray replaceObjectAtIndex:0 withObject:txtGrade1.text];
    [self.scoresArray replaceObjectAtIndex:1 withObject:txtGrade2.text];
    [self.scoresArray replaceObjectAtIndex:2 withObject:txtGrade3.text];
    [self.scoresArray replaceObjectAtIndex:3 withObject:txtGrade4.text];
    [self.scoresArray replaceObjectAtIndex:4 withObject:txtGrade5.text];
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

@end
