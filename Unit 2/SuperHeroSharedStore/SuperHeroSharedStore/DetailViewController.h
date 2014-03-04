//
//  DetailViewController.h
//  SuperHeroSharedStore
//
//  Created by Ron Cavil on 3/3/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    int _superheroindex;
}

@property (weak, nonatomic) IBOutlet UITextField *nameValue;
@property (weak, nonatomic) IBOutlet UITextField *powerValue;
@property (weak, nonatomic) IBOutlet UITextField *secretValue;

- (IBAction)submitButtonClick:(id)sender;
- (IBAction)cancelButtonClick:(id)sender;

-(void) SetSuperHeroIndex:(NSInteger) index;

@end
