//
//  GameCardViewController.h
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameCardViewController : UIViewController
{
    int _gameIndex;
    NSMutableArray *_BoardSquares;
    CGPoint _topLeft;
    
    int _boardColumnWidth;
    int _boardColumnHeight;
    
    int _boardLeftMargin;
    int _boardRightMargin;
    
    int _boardTopMargin;
    int _boardBottomMargin;
    
}
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel;

- (IBAction)buttonBingo:(UIButton *)sender;

//Setters and Getters
-(void) SetGameIndex:(int) gameindex;

-(void) GetNumber;

-(void) SetBoardColumnWidth: (int) boardcolumnwidth;

-(void) SetBoardColumnHeight: (int) boardcolumnheight;

-(void) SetBoardLeftMargin: (int) margin;
-(void) SetBoardRightMargin: (int) margin;

-(void) SetBoardTopMargin: (int) margin;
-(void) SetBoardBottomMargin: (int) margin;

@end

