//
//  ViewController.m
//  TicTacToe
//
//  Created by saroj on 2/4/16.
//  Copyright © 2016 bipin. All rights reserved.
//

#import "ViewController.h"
#define WIN 10
#define LOSE -10
#define DRAW 0
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttons = [[NSMutableArray alloc] init];
    self.board = [[Board alloc] init];
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(120+j*52, 275+i*52, 50, 50);
            [button setBackgroundColor:[UIColor greenColor]];
            [button setTitle:@" " forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.view addSubview:button];
            button.tag = i*3+j;
            [button addTarget:self action:@selector(button_click:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttons addObject:button];
            
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)button_click: (UIButton *)sender {
    int x = (sender.tag)/3;
    int y = sender.tag % 3;
    [self.board omarkOnActual: x : y];
    [self.board omarkOnAssume: x : y];
    NSLog(@"%i",[self.board valueInCell:x :y]);
    [sender setTitle:@"O" forState:UIControlStateNormal];
    sender.enabled = NO;
    //get best value for x
    if ([self getBestValue:&x :&y :1]) {
        int index = x*3+y;
        UIButton *button = [self.buttons objectAtIndex:index];
        [button setTitle:@"X" forState:UIControlStateNormal];
        button.enabled = NO;
    }
    
}

-(BOOL) getBestValue : (int *) x : (int *) y : (BOOL) turn{
    BOOL result=0;
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j<3; j++) {
            if(![self.board valueInCell: i :j]){
                if (turn) {
                    [self.board xmarkOnAssume:i :j];
                }
                else{
                    [self.board omarkOnAssume:i :j];
                }
                
//                GET SCORE
                int score = [self getScore];
                
                if (score == DRAW) {
                    turn = !turn;
                    
                    result = [self getBestValue:x :y :turn];
                    
                }
                
                if (score == WIN){
                    [self.board resetAssume:i :j];
                    *x = i;
                    *y = j;
                    return 1;
                }
                
                
            }
        }
    }
    return 0;
}

-(int) getScore {
    return [self.board checkWinForAssume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    self.titleLabel.text = @" new title";
    //sender.title=@"x";
    //[self.bipButton setTitle:@"x" forState:UIControlStateNormal];
}
@end