//
//  ViewController.h
//  TicTacToe
//
//  Created by saroj on 2/4/16.
//  Copyright © 2016 bipin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *resultButton;
@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) Board *board;


- (IBAction)btn:(id)sender;
-(BOOL) getBestValue : (int *) x : (int *) y: (BOOL) turn;
-(int) getScore ;


@end