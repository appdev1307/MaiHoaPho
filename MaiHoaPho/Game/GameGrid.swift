//
//  GameGrid.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/5/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//  This is class which used for preresent chess pieces and their movement following to Mai Hoa Pho guidline
//

import UIKit

class GameGrid: CALayer {
    let offsetH = -12
    let offsetW = 20
    
    // Number of rows and column
    let gamegridcolumn = 9
    let gamegridrow = 10
    
    
    var gameGridPostion: CGPoint!
    
    var cellHight: Int!
    var cellWidth: Int!
    
    // Array of chess pieces
    var chessPieces:  [[GamePiece?]] = []
    var lastSteps: [LastStepPiece] = []
    var indexStep = 0
    
    // Position initialization for black and red pieces
    let chessPosition = [
        // Black pieces
        11,12,13,14,15,14,13,12,11,
        00,00,00,00,00,00,00,00,00,
        00,16,00,00,00,00,00,16,00,
        17,00,17,00,17,00,17,00,17,
        00,00,00,00,00,00,00,00,00,
        
        // Red pieces
        00,00,00,00,00,00,00,00,00,
        37,00,37,00,37,00,37,00,37,
        00,36,00,00,00,00,00,36,00,
        00,00,00,00,00,00,00,00,00,
        31,32,33,34,35,34,33,32,31
    ]
    
    // 
    // New change for position initialization
    //
    
    // Steps
    var msteps: [String]!
    var mplayer = 1 // Black player is first
    var mindex  = 3
    
    // Chess handler
    var chessHandler: ChessFileHandler! = nil
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func chessHandlerInit(FileName name:String){
        chessHandler = ChessFileHandler(FullName: name)
        print("Title is playing: " + name + "\n")
    }
    
    func goPrevious(){
        if (indexStep < lastSteps.count) && (indexStep >= 0){
            let last = lastSteps[indexStep]
            chessMoveWO(LastPiece: last, UpDownGo: 0)
            
            indexStep   = indexStep - 1
        }
        else{
            print("indexStep = " + String(indexStep) + "\n")
        }
    }
    
    func gotoNext1(){
        if chessHandler != nil{
            
            let nextstep = indexStep + 1
            if (nextstep < (lastSteps.count)){
                let next = lastSteps[nextstep]
                chessMoveWO(LastPiece: next, UpDownGo: 1)
                indexStep = nextstep
            }
            else {
                if !chessHandler.FileEnded {
                    if (mindex > 2){
                        // Come to the next steps
                        msteps  = chessHandler.goNextLine()
                        mplayer = 1 // Black player
                        mindex  = 1
                    }
                    
                    if msteps.count > 1{
                        var locx = [0,0]
                        // 0: alone on the line
                        // 1: before
                        // 2: after
                        
                        if msteps.count > 2{
                            // Black player
                            if msteps[2].elementsEqual("(T)"){
                                locx[0] = 1
                            }
                            else if msteps[2].elementsEqual("(S)"){
                                locx[0] = 2
                            }
                            
                            // Red player
                            if msteps[msteps.count - 1].elementsEqual("(T)"){
                                locx[1] = 1
                            }
                            else if msteps[msteps.count - 1].elementsEqual("(S)"){
                                locx[1] = 2
                            }
                        }
                        
                        if(mindex == 1){
                            // Black player
                            getPostion(Player: mplayer, StepString: msteps[1], Location: locx[0])
                        }
                        else{
                            // Red player
                            if locx[0] > 0{
                                if msteps.count >= 4{
                                    getPostion(Player: mplayer, StepString: msteps[3], Location: locx[1])
                                }
                            }
                            else {
                                if msteps.count >= 3{
                                    getPostion(Player: mplayer, StepString: msteps[2], Location: locx[1])
                                }
                            }
                        }
                        
                        // Update position
                        mindex  = mindex  + 1
                        mplayer = mplayer + 2 // Red player
                    }
                }
            }
        }
    }
    
    func getPostion(Player player:Int, StepString step:String, Location location: Int){
        
        var chessIndex      = 0
        var xtmpchessSelected  = [-1,-1]
        var xchessSelected  = -1
        
        if step.contains("Tg"){
            chessIndex = 1
        }
        
        let chessType      = step[0...chessIndex]
        var currentPostion = Int(step[(chessIndex + 1)...(chessIndex + 1)])
        
        var chessDirection = -1
        if step.contains("."){
            // Moving foward vertically
            chessDirection = 1
        }
        else if step.contains("-"){
            // Moving horizontally
            chessDirection = 0
        }
        else{
            // Moving backward vertically
            // Do noting
        }
        
        let nextPosition   = Int(step[(chessIndex + 3)...(chessIndex + 3)])
        
        if player == 1{
            // Black player
            currentPostion = 9 - currentPostion!
        }
        else{
            // Red player
            currentPostion = currentPostion! - 1
        }
        
        // Looking for selected chess piece
        // Loop in each row
        var j = 0;
        for i in 0..<gamegridrow{
            if chessPieces[i][currentPostion!] != nil{
                // Check it is in the correct turn
                if (chessPieces[i][currentPostion!]?.checkType(Player: player, Type: String(chessType)))!{
                    xtmpchessSelected[j] = i
                    j = j + 1
                }
            }
        }
        
        if location == 1 {
            // before
            if player == 1{
                // Black player
                xchessSelected  = xtmpchessSelected[1]
            }
            else{
                // Red player
                xchessSelected  = xtmpchessSelected[0]
            }
        }
        else if location == 2 {
            // After
            if player == 1{
                // Black player
                xchessSelected  = xtmpchessSelected[0]
            }
            else{
                // Red player
                xchessSelected  = xtmpchessSelected[1]
            }
        }
        else{
            xchessSelected  = xtmpchessSelected[0]
        }
        
        // Calculate the next move in the grid
        if xchessSelected >= 0 {
            let point = ChessRule.getNextMove(ChessPiece: chessPieces[xchessSelected][currentPostion!]!, Grid: self, NextPosition: nextPosition!, Direction: chessDirection)
            
            // Update position in grid
            let x = Int(point.x)
            let y = Int(point.y)
            let oldx = Int((chessPieces[xchessSelected][currentPostion!]?.cellPosition.x)!)
            let oldy = Int((chessPieces[xchessSelected][currentPostion!]?.cellPosition.y)!)
            
            chessMove(X: oldx, Y: oldy, NewX: x, NewY: y)
        }
        else{
            print("MaiHoaPho - " + #function + " - Warning: There is no piece selected")
        }
    }
    
    private func pieceDrawUpdate(Piece piece:GamePiece, X x:Int, Y y:Int){
        if y < 5{
            // the above half
            piece.cellPositionToDraw = CGPoint(x: (x*cellWidth + Int(self.gameGridPostion.x) + offsetW), y: (y*cellHight + Int(self.gameGridPostion.y) + offsetH))
        }
        else {
            // the below half
            piece.cellPositionToDraw = CGPoint(x: (x*cellWidth + Int(self.gameGridPostion.x) + offsetW), y: (y*cellHight + Int(self.gameGridPostion.y) - 4))
        }
        
    }
    
    func isEmpty(X x:Int, Y y:Int) -> Bool{
        
        // Check position inside
        if !self.isInside(X: x, Y: y){
            return false
        }
        
        if  chessPieces[x][y] != nil{
            return false
        }
        
        // It is fine to make a move
        return true
    }
    
    private func chessMove(X x:Int, Y y:Int, NewX newx:Int, NewY newy:Int){
        
        if let chess = chessPieces[x][y]{
            
            let laststep = LastStepPiece()
            
            // Check if there is one enemy in the new position
            if chessPieces[newx][newy] != nil{
                chessKilled(X: newx, Y: newy, Kill: laststep)
            }
            
            // Move chess to new position
            pieceMove(X: x, Y: y, NewX: newx, NewY: newy, Piece: chess)
            self.setNeedsLayout()
            
            // Update last step info
            laststep.currentPiece = chess
            laststep.lastx = x
            laststep.lasty = y
            laststep.newX  = newx
            laststep.newY  = newy
            laststep.stepnumber = chessHandler.StepNumber
            
            // Add the step into the stack
            lastSteps.append(laststep)
            indexStep = lastSteps.count - 1
        }
    }
    
    private func chessMoveWO(LastPiece piece: LastStepPiece?, UpDownGo updown:Int){
        if piece != nil{
            let lastx = piece?.lastx
            let lasty = piece?.lasty
            
            let newx = piece?.newX
            let newy = piece?.newY
            
            if let crpiec = piece?.currentPiece{
                
                let x = Int((crpiec.cellPosition.x))
                let y = Int((crpiec.cellPosition.y))
                
                if updown == 0{
                    pieceMove(X: x, Y: y, NewX: lastx!, NewY: lasty!, Piece: crpiec)
                    
                    // Restore the last killed piece
                    if let lastkilledPiece = piece?.lastkilledPiece{
                        chessPieces[x][y] = lastkilledPiece
                        self.addSublayer(lastkilledPiece)
                    }
                    else{
                        // Do nothing
                    }
                }
                else{
                    // Delete
                    if let chess = chessPieces[newx!][newy!]{
                        chess.removeFromSuperlayer()
                    }
                    pieceMove(X: x, Y: y, NewX: newx!, NewY: newy!, Piece: crpiec)
                }
                self.setNeedsLayout()
            }
        }
    }
    
    private func pieceMove(X x:Int, Y y:Int, NewX newx: Int, NewY newy:Int, Piece piece: GamePiece){
        // Go to the next step which is already processed from text file
        piece.cellPosition      = CGPoint(x: newx, y: newy)
        chessPieces[newx][newy] = piece
        chessPieces[x][y]       = nil   // Clear the old position
        
        // Update position to draw
        pieceDrawUpdate(Piece: piece, X: newy, Y: newx)
    }
    
    private func chessKilled(X x:Int, Y y: Int, Kill kill: LastStepPiece){
        if isInside(X: x, Y: y){
            if let chess = chessPieces[x][y]{
                chess.removeFromSuperlayer()
                chessPieces[x][y]       = nil
                kill.lastkilledPiece    = chess
            }
        }
        else{
            // Do nothing
        }
    }
    
    func isInside(X x:Int, Y y:Int) -> Bool {
        if x < 0 || x > gamegridrow
            || y < 0 || y > gamegridcolumn{
            return false
        }
        return true
    }
    
    func doReset(){
        
        for i in 0..<gamegridrow{
            for j in 0..<gamegridcolumn{
                if let piece = chessPieces[i][j]{
                    piece.removeFromSuperlayer()
                }
            }
        }
        chessPieces.removeAll()
        chessHandler.resetHandler()
        
        lastSteps.removeAll()
        indexStep   = 0
    }
    
    func doInit(X x:Int, y: Int, cellheight: Int, cellwidth: Int){
        self.gameGridPostion = CGPoint(x: x, y: y)
        self.cellHight = cellheight
        self.cellWidth = cellwidth
        
        // Anchor point is 0,0 defaultly
        // Loop in each row for x
        for i in 0..<gamegridrow{
            chessPieces.append([])
            
            // Loop in colum for y
            for j in 0..<gamegridcolumn{
                if chessPosition[i*gamegridcolumn + j] > 0{
                    let piece = GamePiece()
                    
                    piece.setHightWidt(CellHight: cellHight, width: cellWidth)
                    piece.cellPosition = CGPoint(x: i, y: j)
                    piece.setType(CellType: chessPosition[i*gamegridcolumn + j])
                    
                    // Add to tracking
                    pieceDrawUpdate(Piece: piece, X: j, Y: i) // The drawing is reversed with storage position
                    chessPieces[i].append(piece)
                    
                    // Add bpiece to the gird layer
                    self.addSublayer(piece)
                }
                else{
                    chessPieces[i].append(nil)
                }
            }
        }
    }
}
