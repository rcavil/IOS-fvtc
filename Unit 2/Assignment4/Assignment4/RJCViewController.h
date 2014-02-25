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
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property int pickerColumns;
@property (nonatomic, strong) NSString  *safeStoredCombination;

@property (nonatomic, strong) NSMutableArray *safeUserCombination;
@property (nonatomic, strong) NSMutableArray *numberChoices;

//Actions declared

- (IBAction)tryButtonSelected:(UIButton *)sender;
- (IBAction)autoButtonSelected:(UIButton *)sender;


//

- (NSString*) getUserCombinationGuess;
@end
