//
//  ChessRule.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/7/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation
import UIKit

class ChessRule {
    static weak var currentPiece: GamePiece!
    static weak var gameGrid: GameGrid!
    
    static var nextPosition    = 0
    static var direction       = 0
    static var player          = 0 // 0 - Black player, 1 - Red player
    static var piece           = 0
    
    static func getNextMove(ChessPiece piece:GamePiece, Grid grid:GameGrid, NextPosition nextPosition: Int, Direction direction: Int) -> CGPoint {
        self.currentPiece = piece
        self.gameGrid     = grid
        self.nextPosition = nextPosition
        self.direction    = direction
        
        self.player = piece.typeCell / 10
        self.piece  = piece.typeCell % 10
        
        var returnPoint:CGPoint!
        
        // Call respective movement function
        
        // - The checking position of a piece which is the same side of the player - not done
        // - If there is a conflict, we will come back here to check the issue
        
        switch self.piece{
        case 1:
            // "chariot"
            returnPoint = getChariotMove()
            break
        case 2:
            // "horse"
            returnPoint = getHorseMove()
            break
        case 3:
            // "elephant"
            returnPoint = getElephantMove()
            break
        case 4:
            // "advisor"
            returnPoint = getAdvisorMove()
            break
        case 5:
            // "king"
            returnPoint = getKingMove()
            break
        case 6:
            // "cannon"
            returnPoint = getCannonMove()
            break
        case 7:
            // "pawn"
            returnPoint = getPawnMove()
            break
        default:
            // Do nothing
            returnPoint = CGPoint(x: 0, y: 0)
            break
        }
        
        return returnPoint
    }
    
    private static func getPawnMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        _ =    [ [ 0, 1 ], [ 0, -1 ], [-1, 0 ]]
        _ =    [ [ 0, 1 ], [ 0, -1 ], [1, 0 ]]
        
        // Translate position read from text file
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player == 1 {
            // black
            if self.direction == 0 {
                newPosition = 9 - (self.nextPosition)
            }
        } else {
            // red
            if self.direction == 0 {
                newPosition = newPosition - 1
            }
        }
        
        // deviation calculation
        let dev = newPosition - Int(self.currentPiece.cellPosition.y)
        
        if player != 1 {
            // Red
            if Int(self.currentPiece.cellPosition.x) > 4 {
                let e = [Int(self.currentPiece.cellPosition.x) - 1,  Int(self.currentPiece.cellPosition.y)]
                if self.gameGrid.isInside(X: e[0], Y: e[1]){
                    returnPoint = CGPoint(x: e[0], y: e[1])
                }
            }
            else{
                if self.direction == 0 {
                    if dev == 1 || dev == -1
                    {
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x), y: newPosition)
                    }
                    else
                    {
                        returnPoint = CGPoint(x: 0, y: 0)
                    }
                    
                    /*for target in targetU{
                        var e = [Int(self.currentPiece.cellPosition.x) + target[0],  Int(self.currentPiece.cellPosition.y) + target[1]]
                        
                        if !self.gameGrid.isInside(X: e[0], Y: e[1]){
                            continue
                        }
                        
                        if newPosition == e[1]{
                            returnPoint = CGPoint(x: e[0], y: e[1])
                            break
                        }
                    }*/
                }
                else {
                    let e = [Int(self.currentPiece.cellPosition.x) - 1,  Int(self.currentPiece.cellPosition.y)]
                    if self.gameGrid.isInside(X: e[0], Y: e[1]){
                        returnPoint = CGPoint(x: e[0], y: e[1])
                    }
                }
            }
        } else {
            // black
            if Int(self.currentPiece.cellPosition.x) <= 4 {
                let e = [Int(self.currentPiece.cellPosition.x) + 1,  Int(self.currentPiece.cellPosition.y)]
                if self.gameGrid.isInside(X: e[0], Y: e[1]){
                    returnPoint = CGPoint(x: e[0], y: e[1])
                }
            }
            else{
                if self.direction == 0 {
                    if dev == 1 || dev == -1
                    {
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x), y: newPosition)
                    }
                    else
                    {
                        returnPoint = CGPoint(x: 0, y: 0)
                    }
                    
                    /*for target in targetD{
                        var e = [Int(self.currentPiece.cellPosition.x) + target[0],  Int(self.currentPiece.cellPosition.y) + target[1]]
                        
                        if !self.gameGrid.isInside(X: e[0], Y: e[1]){
                            continue
                        }
                        
                        if newPosition == e[1]{
                            returnPoint = CGPoint(x: e[0], y: e[1])
                            break
                        }
                    }*/
                }
                else {
                    let e = [Int(self.currentPiece.cellPosition.x) + 1,  Int(self.currentPiece.cellPosition.y)]
                    if self.gameGrid.isInside(X: e[0], Y: e[1]){
                        returnPoint = CGPoint(x: e[0], y: e[1])
                    }
                }
            }
        }
        
        return returnPoint
    }
    
    private static func getKingMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let targets =    [ [ 0, 1 ], [ 0, -1 ], [ 1, 0 ], [-1, 0 ]]
        
        // Translate position read from text file
        self.nextPosition = self.nextPosition - 1
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player != 1 {
            // Red -> do nothing
        } else {
            // black
            newPosition = 8 - self.nextPosition;
        }
        
        if self.direction == 0 {
            // Vertical moving
            for target in targets{
                let e = [target[0] + Int(self.currentPiece.cellPosition.x),  target[1] + Int(self.currentPiece.cellPosition.y)]
                if newPosition == e[1] && self.gameGrid.isInside(X: e[0], Y: e[1]){
                    returnPoint = CGPoint(x: e[0], y: e[1])
                    break
                }
            }
        }
        else if self.direction == 1 {
            // Move forward horizontally
            var e: [Int]
            if player == 1 {
                // black
                e = [Int(self.currentPiece.cellPosition.x) + 1,  Int(self.currentPiece.cellPosition.y)]
                
            }
            else{
                // red
                e = [Int(self.currentPiece.cellPosition.x) - 1,  Int(self.currentPiece.cellPosition.y)]
            }
            
            if self.gameGrid.isInside(X: e[0], Y: e[1]){
                returnPoint = CGPoint(x: e[0], y: e[1])
            }
        }
        else{
            // Move backward horizontally
            var e: [Int]
            if player == 1 {
                // black
                e = [Int(self.currentPiece.cellPosition.x) - 1,  Int(self.currentPiece.cellPosition.y)]
                
            }
            else{
                // red
                e = [Int(self.currentPiece.cellPosition.x) + 1,  Int(self.currentPiece.cellPosition.y)]
            }
            
            if self.gameGrid.isInside(X: e[0], Y: e[1]){
                returnPoint = CGPoint(x: e[0], y: e[1])
            }
        }
        
        return returnPoint
    }
    
    private static func getAdvisorMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let target =    [ [ -1, -1 ], [ 1, 1 ], [ -1, 1 ], [ 1, -1 ]]
        var bmatched = false
        
        // Translate position read from text file
        self.nextPosition = self.nextPosition - 1
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player != 1 {
            // Red -> do nothing
        } else {
            // black
            newPosition = 8 - self.nextPosition;
        }
        
        let x = Int(self.currentPiece.cellPosition.x)
        
        for i in 0..<target.count{
            let e = [target[i][0] + Int(self.currentPiece.cellPosition.x),  target[i][1] + Int(self.currentPiece.cellPosition.y)]
            
            // Inside game board
            if !self.gameGrid.isInside(X: e[0], Y: e[1]){
                continue
            }
            
            if (newPosition == e[1]){
                if (player != 1) {
                    // Red
                    if (self.direction == 1){
                        if (e[0] < x){
                            bmatched = true
                        }
                    }
                    else {
                        if (e[0] > x){
                            bmatched = true
                        }
                    }
                }
                else {
                    // black
                    if (self.direction == 1){
                        if (e[0] > x){
                            bmatched = true
                        }
                    }
                    else {
                        if (e[0] < x){
                            bmatched = true
                        }
                    }
                }
            }
            
            if bmatched == true {
                returnPoint = CGPoint(x: e[0], y: e[1])
                break
            }
        }
        
        
        return returnPoint
    }
    
    private static func getElephantMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let target =    [ [ -2, -2 ], [ 2, -2 ], [ -2, 2 ], [ 2, 2 ]]
        var bmatched = false
        
        // Translate position read from text file
        self.nextPosition = self.nextPosition - 1
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player != 1 {
            // Red -> do nothing
        } else {
            // black
            newPosition = 8 - self.nextPosition;
        }
        
        for i in 0..<target.count{
            let e = [target[i][0] + Int(self.currentPiece.cellPosition.x),  target[i][1] + Int(self.currentPiece.cellPosition.y)]
            
            // Inside game board
            if !self.gameGrid.isInside(X: e[0], Y: e[1]){
                continue
            }
            
            if player != 1 && e[0] < 5 {
                // Red
                continue
            } else if player == 1 && e[0] > 4 {
                // black
                continue
            }
            
            if newPosition == e[1]{
                if player != 1 {
                     // Red
                    if self.direction == 1{
                        if e[0] < Int(self.currentPiece.cellPosition.x){
                            bmatched = true
                        }
                    }
                    else {
                        if e[0] > Int(self.currentPiece.cellPosition.x){
                            bmatched = true
                        }
                    }
                }
                else {
                    // black
                    if self.direction == 1{
                        if e[0] > Int(self.currentPiece.cellPosition.x){
                            bmatched = true
                        }
                    }
                    else {
                        if e[0] < Int(self.currentPiece.cellPosition.x){
                            bmatched = true
                        }
                    }
                }
            }
            
            if bmatched == true {
                returnPoint = CGPoint(x: e[0], y: e[1])
                break
            }
        }
        
        return returnPoint
    }
    
    private static func getCannonMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let yOfs = [1,2,3,4,5,6,7,8]
        let xOfs = [1,2,3,4,5,6,7,8,9]
        
        // Note: We have not checked any conflict in moving of Cannon. Because we are believing in Mai Hoa Pho book
        
        var newPosition =  self.nextPosition
        // Translate new position partially
        if player != 1 {
            // Red
            if self.direction == 0 {
                newPosition = newPosition - 1;
            }
        } else {
            // black
            if self.direction == 0 {
                newPosition = 9 - (self.nextPosition)
            }
        }
        
        if self.direction == 0 {
            // Vertical moving
            for move in yOfs{
                let rmove = [Int(self.currentPiece.cellPosition.x),Int(self.currentPiece.cellPosition.y) + move]
                
                
                if !self.gameGrid.isInside(X: rmove[0], Y: rmove[1]){
                    continue
                }
                
                if newPosition == rmove[1]{
                    returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x), y: newPosition)
                    break
                }
                else{
                    // do nothing
                }
            }
            
            for move in yOfs{
                let lmove = [Int(self.currentPiece.cellPosition.x),Int(self.currentPiece.cellPosition.y) - move]
                if !self.gameGrid.isInside(X: lmove[0], Y: lmove[1]){
                    continue
                }
                
                if newPosition == lmove[1]{
                    returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x), y: newPosition)
                    break
                }
                else{
                    // do nothing
                }
            }
        }
        else if self.direction == 1 {
            // Move forward horizontally
            if player == 1 {
                // black
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) + move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x) + move, y: Int(self.currentPiece.cellPosition.y))
                        break
                    }
                }
            } else {
                // red
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) - move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x) - move, y: Int(self.currentPiece.cellPosition.y))
                        break
                    }
                }
            }
        }
        else{
            // Move backward horizontally
            if player == 1 {
                // black
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) - move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x) - move, y: Int(self.currentPiece.cellPosition.y))
                        break
                    }
                }
            } else {
                // red
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) + move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: Int(self.currentPiece.cellPosition.x) + move, y: Int(self.currentPiece.cellPosition.y))
                        break
                    }
                }
            }
        }
        
        return returnPoint
    }
    
    private static func getChariotMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let yOfs = [1,2,3,4,5,6,7,8]
        let xOfs = [1,2,3,4,5,6,7,8,9]
        
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player != 1 {
            // Red
            if self.direction == 0 {
                newPosition = newPosition - 1;
            }
        } else {
            // black
             if self.direction == 0 {
                newPosition = 9 - (self.nextPosition)
            }
        }
        
        if self.direction == 0 {
            // Vertical moving
            for move in yOfs{
                let rmove = [Int(self.currentPiece.cellPosition.x),Int(self.currentPiece.cellPosition.y) + move]
                
                
                if !self.gameGrid.isInside(X: rmove[0], Y: rmove[1]){
                    continue
                }
                
                if newPosition == rmove[1]{
                    returnPoint = CGPoint(x: rmove[0], y: rmove[1])
                    break
                }
                else{
                    // do nothing
                }
            }
            
            for move in yOfs{
                let lmove = [Int(self.currentPiece.cellPosition.x),Int(self.currentPiece.cellPosition.y) - move]
                if !self.gameGrid.isInside(X: lmove[0], Y: lmove[1]){
                    continue
                }
                
                if newPosition == lmove[1]{
                    returnPoint = CGPoint(x: lmove[0], y: lmove[1])
                    break
                }
                else{
                    // do nothing
                }
            }
        }
        else if self.direction == 1 {
            // Move forward horizontally
            if player == 1 {
                // black
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) + move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: umove[0], y: umove[1])
                        break
                    }
                }
            } else {
                // red
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) - move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: umove[0], y: umove[1])
                        break
                    }
                }
            }
        }
        else{
            // Move backward horizontally
            if player == 1 {
                // black
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) - move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: umove[0], y: umove[1])
                        break
                    }
                }
            } else {
                // red
                for move in xOfs{
                    let umove = [Int(self.currentPiece.cellPosition.x) + move,Int(self.currentPiece.cellPosition.y)]
                    
                    if !self.gameGrid.isInside(X: umove[0], Y: umove[1]){
                        continue
                    }
                    
                    if move == newPosition{
                        returnPoint = CGPoint(x: umove[0], y: umove[1])
                        break
                    }
                }
            }
        }
        
        return returnPoint
    }
    
    private static func getHorseMove() -> CGPoint{
        var returnPoint = CGPoint(x: 0, y: 0)
        
        let target = [ [ 1, -2 ], [ 2, -1 ], [ 2, 1 ], [ 1, 2 ], [ -1, 2 ], [ -2, 1 ], [ -2, -1 ],
                       [ -1, -2 ] ]
        let obstacle =  [ [ 0, -1 ], [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ], [ -1, 0 ], [ -1, 0 ],
                       [ 0, -1 ] ]
        var bmatched = false
        
        // Translate position read from text file
        self.nextPosition = self.nextPosition - 1
        var newPosition =  self.nextPosition
        
        // Translate new position partially
        if player != 1 {
            // Red -> do nothing
        } else {
            // black
            newPosition = 8 - self.nextPosition;
        }
        
        for i in 0..<target.count{
            let e = [target[i][0] + Int(self.currentPiece.cellPosition.x),  target[i][1] + Int(self.currentPiece.cellPosition.y)]
            let f = [obstacle[i][0] + Int(self.currentPiece.cellPosition.x), obstacle[i][1] + Int(self.currentPiece.cellPosition.y)]
            
            // Inside game board
            if !self.gameGrid.isInside(X: e[0], Y: e[1]){
                continue
            }
            
            if self.gameGrid.isEmpty(X: f[0], Y: f[1]){
                
                if newPosition == e[1]{ // Reversed direction
                    if player != 1 {
                        // Red
                        if self.direction == 1{
                            if e[0] < Int(self.currentPiece.cellPosition.x){
                                bmatched = true
                            }
                        }
                        else{
                            if e[0] > Int(self.currentPiece.cellPosition.x){
                                bmatched = true
                            }
                        }
                    } else {
                        // black
                        if self.direction == 1{
                            if e[0] > Int(self.currentPiece.cellPosition.x){
                                bmatched = true
                            }
                        }
                        else{
                            if e[0] < Int(self.currentPiece.cellPosition.x){
                                bmatched = true
                            }
                        }
                    }
                }
                
                if (bmatched == true) {
                    returnPoint = CGPoint(x: e[0], y: e[1])
                    // The checking position of a piece which is the same side of the player - not done
                    break;
                }
            }
            
            // Position accupied
            
        }
        
        return returnPoint
    }
    
}
