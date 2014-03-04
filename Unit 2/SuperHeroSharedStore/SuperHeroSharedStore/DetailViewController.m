//
//  DetailViewController.m
//  SuperHeroSharedStore
//
//  Created by Ron Cavil on 3/3/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import "DetailViewController.h"
#import "superhero.h"
#import "SuperheroStore.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize nameValue,powerValue,secretValue;

- (id) init
{
    self=[super init];
    
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    Superhero *tempSuperhero=[[SuperheroStore SharedStore] SuperheroAtIndex:_superheroindex];

    [nameValue setText: [tempSuperhero Name]];
    [powerValue setText: [tempSuperhero Secret]];
    [secretValue setText: [tempSuperhero Power]];
    
}


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

    Superhero *tempSuperhero=[[SuperheroStore SharedStore] SuperheroAtIndex:_superheroindex];
    [nameValue setText: [tempSuperhero Name]];
    [powerValue setText:[tempSuperhero Power]];
    [secretValue setText:[tempSuperhero Secret]];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

    Superhero *tempSuperhero=[[SuperheroStore SharedStore] SuperheroAtIndex:_superheroindex];
    
    [tempSuperhero SetName:[nameValue text]];
    [tempSuperhero SetPower:[powerValue text]];
    [tempSuperhero SetSecret:[secretValue text]];
    
}

- (IBAction)cancelButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) SetSuperHeroIndex:(NSInteger) index
{
    _superheroindex=index;
}
@end
