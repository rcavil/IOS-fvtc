//
//  superheroViewController.m
//  SuperHeros
//
//  Created by Ron Cavil on 2/3/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "superheroViewController.h"
#import "Superhero.h"

@interface superheroViewController ()

@end

@implementation superheroViewController

@synthesize nameField, powerField, secretField, ageField;


- (void) touchesEnded: (NSSet*) touches withEvent:(UIEvent *)event
{
    //dismiss keyboards
    
    [nameField resignFirstResponder];
    [powerField resignFirstResponder];
    [secretField resignFirstResponder];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    index=0;
    
    
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

    //NSLog(@"Name: %@",name);
    //NSLog(@"Secret:%@",secret);
    //NSLog(@"Power: %@",power);
    
    
    Superhero *hero = [[Superhero alloc] init];
    
    [hero SetName:name];
    [hero SetPower:power];
    [hero SetSecret:secret];
    
    NSLog(@"index: %i||%@",index,hero);

    /*
    if (index <20)
    {
        _heroes[index] =hero;
        index++;
    }
     
     _heroes[index] =hero;
     index++;

*/
    //NSLog(@"Index: %@",power);

    [heroes addObject:hero];
    
    for (int i=0; i< [heroes count]; i++)
    {
        NSLog(@"index: %i||%@",i, [heroes objectAtIndex:i]);
    }
    

    
    int age =[[ageField text] intValue];
    
    
    switch (age) {
        case 0-10:
            NSLog(@"Child");
            break;
            
        case 11-20:
            NSLog(@"Teenager");
            break;
            
        default:
            break;
    }
    
    
    int product=[self productWithNumber:4 withNumber2:6 withNumber3:9];
    
}

-(int) productWithNumber: (int) num1 withNumber2:(int) num2 withNumber3:(int) num3
{
    int product =num1*num2*num3;
    return product;
}

@end
