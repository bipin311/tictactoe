//
//  Board.h
//  TicTacToe
//
//  Created by bipin on 2/8/16.
//  Copyright © 2016 bipin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject
{
    int actual[3][3];
    int assume[3][3];
    
    
}

-(void) xmarkOnAssume : (int) x : (int) y;
-(void) xmarkOnActual : (int) x : (int) y;

-(void) omarkOnAssume : (int) x : (int) y;
-(void) omarkOnActual : (int) x : (int) y;

-(void) resetAssume : (int) x : (int) y;
-(void) resetActual : (int) x : (int) y;


-(int) valueInCell : (int) x : (int) y;

-(int) checkWin;
-(int) checkWinForAssume;

@end
