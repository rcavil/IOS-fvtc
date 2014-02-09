//
//  RJCViewController.h
//  Assignment3
//
//  Created by Ron on 2/8/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController

- (IBAction)hideKeyboard:(UITextField *)sender;
- (IBAction)btnSubmitChosen:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblGradeResults;

-(double) getAverageScore;
-(NSString *) getLetterGrade:(double)gradeNumeric;
-(NSString *) getGradeResultText:(double)gradeNumeric :(NSString *)letterGrade;

@end
