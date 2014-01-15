//
//  HelloWorldViewController.m
//  Assignment_01
//
//  Created by Ron on 1/14/14.
//  Copyright (c) 2014 edu.self. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Set the display label text value
    
    _lblDisplayMessage.text=@"How many total snow days and early releases will my kids have this winter?";

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
