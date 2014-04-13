//
//  GameDetailViewController.m
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameDetailViewController.h"
#import "Game.h"
#import "GameStore.h"
#import "GameCardViewController.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController

@synthesize NameLabel, DescriptionLabel, WinCountLabel, UserCountLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Create game object
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    
    //Display game values
    [NameLabel setText:[game Name]];
    [DescriptionLabel setText: [game Description]];
    [WinCountLabel setText: [NSString stringWithFormat:@"%i", [game WinCount]]];
    [UserCountLabel setText: [NSString stringWithFormat:@"%i", [game UserCount]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) SetGameIndex:(int)gameindex
{
    _GameIndex = gameindex;
}


- (IBAction)JoinButtonClick:(id)sender {
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    
    void (^block)(void) = ^{
            NSLog(@"GameDetailViewController Join Complete");
            GameCardViewController *gc = [[GameCardViewController alloc] init];
            [gc SetGameIndex: _GameIndex];
            [[self navigationController] pushViewController:gc animated:YES];
           };
    
    
    [[GameStore SharedStore] JoinGame:[game GameID] withBlock:block];
}

- (IBAction)QuitButtonClick:(id)sender {
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    
    void (^block)(void) = ^{
        NSLog(@"GameDetailViewController Quit Complete");
        [[self navigationController] popViewControllerAnimated:YES];
    };
    [[GameStore SharedStore] QuitGame:[game GameID] withBlock:block];
}
@end
