//
//  Board.m
//  TicTacToe
//
//  Created by bipin on 2/8/16.
//  Copyright © 2016 bipin. All rights reserved.
//

#import "Board.h"

@implementation Board

-(void) xmarkOnAssume : (int) x : (int) y{
    assume[x][y] = 1;
}
-(void) xmarkOnActual : (int) x : (int) y{
    actual[x][y] = 1;
}

-(void) omarkOnAssume : (int) x : (int) y{
    assume[x][y] = 2;
}

-(void) omarkOnActual : (int) x : (int) y{
    actual[x][y] = 2;
}

-(int) valueInCell : (int) x : (int) y{
    return actual[x][y];
}

-(void) resetAssume : (int) x : (int) y{
    assume[x][y] = 0;
}
-(void) resetActual : (int) x : (int) y{
    actual[x][y] = 0;
}

-(int) checkWin{
    for (int i = 0; i<3; i++) {
        if (actual[i][0]==actual[i][1] && actual[i][1] == actual[i][2]) {
            return 1;
        }
        else if(actual[0][i] == actual[1][i] && actual[1][i] == actual[2][i]){
            return 1;
        }
    }
    if (actual[1][1] == actual[2][2] && actual[1][1] == actual[0][0]) {
        return 1;
        
    }
    else if (actual[1][1] == actual[0][2] && actual[1][1] == actual[2][0]){
        return 1;
    }
    else{
        return 0;
    }
}

-(int) checkWinForAssume{
    for (int i = 0; i<3; i++) {
        if (assume[i][0]==assume[i][1] && assume[i][1] == assume[i][2]) {
            if (assume[i][0] == 1) {
                return 10;
            }else if (assume[i][0] == 2) {
                return -10;
            }
        }
        if(assume[0][i] == assume[1][i] && assume[1][i] == assume[2][i]){
            if (assume[0][i] == 1) {
                return 10;
            }else if (assume[0][i] == 2) {
                return -10;
            }
        }
    }
    if (assume[1][1] == assume[2][2] && assume[1][1] == assume[0][0]) {
        if (assume[1][1] == 1) {
            return 10;
        }else if (assume[1][1] == 2) {
            return -10;
        }
        
    }
    if (assume[1][1] == assume[0][2] && assume[1][1] == assume[2][0]){
        if (assume[1][1] == 1) {
            return 10;
        }else if (assume[1][1] == 2) {
            return -10;
        }
    }
    return 0;
}

@end
