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

@property (weak, nonatomic) IBOutlet UITextField *textSearchEntry;

-(void) setSearchEntryIndex:(long) index;

- (IBAction)buttonSearchEntrySave:(id)sender;
- (IBAction)hideKeyboard:(UITextField *)sender;

@end
