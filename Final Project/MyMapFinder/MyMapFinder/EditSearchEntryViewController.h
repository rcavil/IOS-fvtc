//
//  EditSearchEntryViewController.h
//  MyMapFinder
//
//  Created by Ron on 4/26/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditSearchEntryViewController : UIViewController
{
    long _searchEntryIndex;
    
}

-(void) setSearchEntryIndex:(long) index;

- (IBAction)buttonSearchEntrySave:(id)sender;
- (IBAction)buttonSearchEntryCancel:(UIButton *)sender;
- (IBAction)hideKeyboard:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *textSearchEntry;

@end
