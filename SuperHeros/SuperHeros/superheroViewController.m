//
//  superheroViewController.m
//  SuperHeros
//
//  Created by Ron Cavil on 2/3/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "superheroViewController.h"

@interface superheroViewController ()

@end

@implementation superheroViewController

@synthesize nameField, powerField, secretField;


- (void) touchesEnded: (NSSet*) touches withEvent:(UIEvent *)event
{
    [nameField resignFirstResponder];
    [powerField resignFirstResponder];
    [secretField resignFirstResponder];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearButton:(id)sender {
}
- (IBAction)didEndOnExit:(id)sender {
}

- (IBAction)powerDidEndOnExit:(UITextField *)sender {
}

- (IBAction)secretDidEndOnExit:(id)sender {
}

- (IBAction)submitButtonSelected:(id)sender {
    NSString *name= [nameField text];
    NSString *secret= [secretField text];
    NSString *power= [powerField text];
    
    NSLog(@"Name: %@",name);
    NSLog(@"Secret:%@",secret);
    NSLog(@"Power: %@",power);    
}
@end
