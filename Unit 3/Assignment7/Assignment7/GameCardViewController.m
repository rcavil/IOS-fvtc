//
//  GameCardViewController.m
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameCardViewController.h"
#import "GameStore.h"
#import "Game.h"
#import <QuartzCore/QuartzCore.h>
#import "Board.h"

@interface GameCardViewController ()

@end

@implementation GameCardViewController

@synthesize NumberLabel;

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
    // Do any additional setup after loading the view from its nib.
    
    _BoardSquares = [[NSMutableArray alloc] init];
    //Blank out default number label value
    [NumberLabel setText:@""];
    
    //Set values for bingo board borders
    [self SetBoardColumnWidth:(50)];
    [self SetBoardColumnHeight:(50)];
    
    [self SetBoardLeftMargin:(25)];
    [self SetBoardRightMargin:(275)];
    
    [self SetBoardTopMargin:(150)];
    [self SetBoardBottomMargin:(400)];
    
    //Timer to display next bing number
    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(GetNumber) userInfo:nil repeats:YES];

    //Draw the bingo board
    [self DrawHeading];
    [self DrawBoard];
    [self PopulateBoard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Setters, Getters
-(void) SetGameIndex:(int) gameindex
{
    _gameIndex = gameindex;
}

-(void) SetBoardColumnWidth:(int)boardcolumnwidth

{
    _boardColumnWidth= boardcolumnwidth;
}

-(void) SetBoardColumnHeight:(int)boardcolumnheight

{
    _boardColumnHeight= boardcolumnheight;
}

-(void) SetBoardTopMargin: (int) margin

{
    _boardTopMargin=margin;
}

-(void) SetBoardBottomMargin: (int) margin

{
    _boardBottomMargin=margin;
}

-(void) SetBoardLeftMargin: (int) margin

{
    _boardLeftMargin=margin;
}

-(void) SetBoardRightMargin: (int) margin

{
    _boardRightMargin=margin;
}


//Bingo button pressed, confirm if a bingo winner
- (IBAction)buttonBingo:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Possible Bingo" message:@"Verify Your Card.  Are you a winner?"
    delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];
}

//Get and display the next bingo number
-(void) GetNumber
{
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex:_gameIndex];
    void (^block)(void) = ^{
        NSLog(@"GameCardViewController GetNumber Complete");
        [NumberLabel setText:[[GameStore SharedStore] Number] ];
    };
    [[GameStore SharedStore] GetNextNumber:[game GameID] withBlock:block];
}

//Populate the bing board with the numbers that were generated from the webservice
-(void) PopulateBoard
{
    int countLoop=0;
    int rowCount=0;
    
    int leftMargin=30;
    int topMargin=150;
    _topLeft = [self view].frame.origin;
    
    _topLeft.x += leftMargin;
    _topLeft.y += topMargin;

    NSArray *boardSquares=[[GameStore SharedStore] GetGameSquares];
    
    for(NSString * squareValue in boardSquares)
    {
        [self AddText:_topLeft withText:squareValue];
        countLoop++;
        
        
        if ((countLoop % 5) == 0)
        {
            rowCount++;
            _topLeft = [self view].frame.origin;
            _topLeft.x += leftMargin;
            _topLeft.y += topMargin+(rowCount*_boardColumnHeight);
            
        } else
        {
            _topLeft.x += _boardColumnWidth;
        }
    }
    
}

//Draw the heading on the bingo board
-(void) DrawHeading
{
    _topLeft = [self view].frame.origin;
    
    _topLeft.x += 40;
    _topLeft.y += 115;
    
    [self AddText:_topLeft withText:@"B"];
  
    _topLeft.x += _boardColumnWidth;
    [self AddText:_topLeft withText:@"I"];
    
    _topLeft.x += _boardColumnWidth;
    [self AddText:_topLeft withText:@"N"];
    
    _topLeft.x += _boardColumnWidth;
    [self AddText:_topLeft withText:@"G"];
    
    _topLeft.x += _boardColumnWidth;
    [self AddText:_topLeft withText:@"O"];
}

//Draw the lines on the bingo board
-(void) DrawBoard
{
    _topLeft = [self view].frame.origin;
    
    //draw vertical lines
    for (int x = _boardLeftMargin; x <= _boardRightMargin; x +=_boardColumnWidth)
    {
        [self DrawLine:CGPointMake(x, _boardTopMargin)
               withEnd:CGPointMake(x, _boardBottomMargin)];
    }

    //draw horizontal lines
    for (int y = _boardTopMargin; y <= _boardBottomMargin; y +=_boardColumnHeight)
    {
        [self DrawLine:CGPointMake(_boardLeftMargin, y)
               withEnd:CGPointMake(_boardRightMargin, y)];
    }

}

//Worker method to draw passed in line cordinates
-(void) DrawLine:(CGPoint) start withEnd:(CGPoint) end
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [path addLineToPoint:end];
    [path closePath];
    
    Board *line = [Board layer];
    line.path = path.CGPath;
    line.fillColor = [UIColor blackColor].CGColor;
    line.lineWidth = 3.0;
    line.strokeColor = [UIColor blackColor].CGColor;
     [[[self view] layer] addSublayer:line];
    
    [_BoardSquares addObject:line];
    
}

//Worker method to draw the displayed text values
-(void) AddText:(CGPoint) p withText:(NSString*) text
{
    CATextLayer *label = [[CATextLayer alloc] init];
    [label setFont:@"Helvetica-Bold"];
    [label setFontSize:30];
    [label setFrame:[self.view.layer frame]];
    [label setPosition:p];
    [label setAnchorPoint:CGPointMake(0, 0)];
    [label setString:  text];
    [label setAlignmentMode:kCAAlignmentLeft];
    [label setForegroundColor:[[UIColor blackColor] CGColor]];
    [[[self view] layer] addSublayer:label];
}

//Workeer method to draw the passed in circle cordinates
-(void) AddCircle:(CGPoint) p
{
    NSLog(@"Touching point:%f, %f", p.x, p.y);
    
    int circleSize=40;
    
    //create a layer aka a canvas to draw on
    Board *circle = [Board layer];
    //create a rectangle to bound the bezier curve
    CGRect circleRectangle = CGRectMake(0, 0, circleSize, circleSize);
    //tell the layer that it's a circle
    circle.path = [UIBezierPath bezierPathWithRoundedRect:circleRectangle cornerRadius:circleSize].CGPath;
    //set the position of the circle
    
    p.x -= 20;
    p.y -= 20;
    
    circle.position = p;
    //set the fill color of the circle
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = [UIColor redColor].CGColor;
    
    
    [[[self view] layer] addSublayer:circle];
    
    [circle SetBounds:[[self view] bounds]];
    [_BoardSquares addObject:circle];
    
}


//If user touched the screen, see if touch occoured on the bingo board.  If so, draw circle on touched square
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the point where the touch occurred in the view
    CGPoint p = [[touches anyObject] locationInView:self.view];

    
    
    bool collision = NO;
    
    for (CAShapeLayer *l in self.view.layer.sublayers)
    {
        
        if ([l isKindOfClass:[CAShapeLayer class]])
        {
            
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
            
            if (CGPathContainsPoint(l.path, &transform,  p, NO))
            {
                collision = YES;
            }
        }
        
    }
    
    if (!collision)
    {
        //Check to see if point is on the bingo board
        if ( (p.y >=_boardTopMargin && p.y <= _boardBottomMargin) && (p.x >= _boardLeftMargin && p.x <= _boardRightMargin))
        {
            [self AddCircle:p];
        }

    }
    
}


@end
