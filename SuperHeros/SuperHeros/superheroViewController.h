//
//  superheroViewController.h
//  SuperHeros
//
//  Created by Ron Cavil on 2/3/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Superhero.h"

@interface superheroViewController : UIViewController

{
  //private
    //Superhero *_heroes[20];
    
    NSMutableArray *heroes;
    
    int index;
        
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *powerField;
@property (weak, nonatomic) IBOutlet UITextField *secretField;

- (IBAction)clearButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)didEndOnExit:(id)sender;
- (IBAction)powerDidEndOnExit:(UITextField *)sender;
- (IBAction)secretDidEndOnExit:(id)sender;

- (IBAction)submitButtonSelected:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ageField;

@end
