//
//  RJCViewController.h
//  Assignment4
//
//  Created by Ron on 2/23/14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//Properties declared

//Combination picker for user to select the safe combination
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

//Number of columns in combination picker
@property int pickerColumns;

//Array to hold number values to be displayed on combination picker.  0-9
@property (nonatomic, strong) NSMutableArray *numberChoices;

//Combination that user needs to guess
@property (nonatomic, strong) NSString  *safeStoredCombination;

//Value of what the user has selected for the safe combination
@property (nonatomic, strong) NSMutableArray *safeUserCombination;

//Actions declared

//Action when use submits their guess on what the combination is
- (IBAction)tryButtonSelected:(UIButton *)sender;

//Action that will show user what the safe combination was
- (IBAction)autoButtonSelected:(UIButton *)sender;


//Method to return string value of what the user has guess the safe combination to be

- (NSString*) getUserCombinationGuess;
@end
