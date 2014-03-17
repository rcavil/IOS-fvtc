//
//  MainViewController.h
//  Assignment5
//
//  Created by Ron on 3/16/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//Properties declared

//Number of columns in combination picker
@property int pickerColumns;


//Outlets
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

//Actions
- (IBAction)buttonAddSong:(UIButton *)sender;

@end
