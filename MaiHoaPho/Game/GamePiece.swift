//
//  GamePiece.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/5/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit

class GamePiece: CALayer {
    private var _typeCell: Int = 0
    var typeCell: Int! {
        get {
            return (self._typeCell)
        }
        set (newtype){
            self._typeCell = newtype
        }
    }
    
    private var cellHight: Int!
    private var cellWidth: Int!
    
    // This is board position
    private var _cellPosition = CGPoint(x: 0, y: 0)
    var cellPosition: CGPoint! {
        get {
            return self._cellPosition
        }
        
        set(newPosition){
            self._cellPosition = newPosition
        }
    }
    
    // This position is used to draw piece on game board
    var cellPositionToDraw: CGPoint! {
        get{
            return self.position
        }
        set(newPosition) {
            self.position = newPosition
            self.needsDisplay()
        }
    }
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func checkType(Player player: Int, Type type:String) -> Bool{
        let tmpplayer = self.typeCell / 10
        let tmppiece  = self.typeCell % 10
        
        var matched = false
        
        if tmpplayer != player{
            matched = false
        }
        else
        {
            switch tmppiece{
            case 1:
                // "chariot"
                matched = (type == "X")
                break
            case 2:
                // "horse"
                matched = (type == "M")
                break
            case 3:
                // "elephant"
                 matched = (type == "T")
                break
            case 4:
                // "advisor"
                 matched = (type == "S")
                break
            case 5:
                // "king"
                matched = (type == "Tg")
                break
            case 6:
                // "cannon"
                matched = (type == "P")
                break
            case 7:
                // "pawn"
                matched = (type == "C")
                break
            default:
                matched = false
            }
        }
        
        return matched
    }
    
    func setHightWidt(CellHight hight:Int, width:Int){
        self.cellHight = hight
        self.cellWidth = width
        
        // Set frame for CALayer
        self.frame = CGRect(x: 0, y: 0, width: width, height: hight)
    }
    
    func setType(CellType type:Int){
        let player = type / 10
        let piece = type % 10
        
        var f1name: String!
        var f2name: String!
        
        self.typeCell = type
        
        if player == 1{
            // Black player
            f1name = "b"
        }
        else{
            // Red player
            f1name = "r"
        }
        
        switch piece{
        case 1:
            f2name = "chariot"
        case 2:
            f2name = "horse"
        case 3:
            f2name = "elephant"
        case 4:
            f2name = "advisor"
        case 5:
            f2name = "king"
        case 6:
            f2name = "cannon"
        case 7:
            f2name = "pawn"
        default:
            f2name = "pawn"
        }
        
        let cellimage = UIImage(named: f1name+f2name+".png")
        self.contents = cellimage?.resizeImage(image: cellimage!, targetSize: self.bounds.size).cgImage
    }
}
