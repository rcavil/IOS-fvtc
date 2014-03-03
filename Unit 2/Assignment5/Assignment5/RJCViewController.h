//
//  RJCViewController.h
//  Assignment5
//
//  Created by Ron on 3/2/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJCViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//Declare Actions
- (IBAction)deleteSong:(id)sender;

//Declare Properties

  //Number of columns in combination picker
@property int pickerColumns;

  //Array to hold number values to be displayed on combination picker.  0-9
@property (nonatomic, strong) NSMutableArray *numberChoices;


//Declare Outlets
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
