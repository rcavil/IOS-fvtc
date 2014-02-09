//
//  RJCViewController.h
//  Assignment3
//
//  Created by Ron on 2/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController


//Actions for screen events
- (IBAction)hideKeyboard:(UITextField *)sender;
- (IBAction)btnSubmitChosen:(UIButton *)sender;

//Properies for screen controls
@property (weak, nonatomic) IBOutlet UILabel *lblGradeResults;

@property (weak, nonatomic) IBOutlet UITextField *txtGrade1;
@property (weak, nonatomic) IBOutlet UITextField *txtGrade2;
@property (weak, nonatomic) IBOutlet UITextField *txtGrade3;
@property (weak, nonatomic) IBOutlet UITextField *txtGrade4;
@property (weak, nonatomic) IBOutlet UITextField *txtGrade5;

//Functions for calculating and displaying grade results
-(double) getAverageScore;
-(NSString *) getLetterGrade:(double)gradeNumeric;
-(NSString *) getGradeResultText:(double)gradeNumeric :(NSString *)letterGrade;
-(void) setGradeScores;
@end
