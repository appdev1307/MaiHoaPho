//
//  LastStepPiece.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/21/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation


// This class is used to keep tracking what moving in the board.
// And then we can use them to do reversal moving

class LastStepPiece{
    
    private var _stepnumber = 0
    var stepnumber: Int{
        get{
            return self._stepnumber
        }
        set(newvalue){
            self._stepnumber = newvalue
        }
    }
    
    private var _currentPiece: GamePiece? = nil
    var currentPiece: GamePiece?{
        get{
            return self._currentPiece
        }
        set(newvalue){
            self._currentPiece = newvalue
        }
    }
    
    private var _lastkilledPiece: GamePiece? = nil
    var lastkilledPiece: GamePiece?{
        get{
            return self._lastkilledPiece
        }
        set(newvalue) {
            self._lastkilledPiece = newvalue
        }
    }
    
    private var _newx =  -1
    var newX:Int{
        get{
            return self._newx
        }
        set(newvalue){
            self._newx = newvalue
        }
    }
    
    private var _newy = -1
    var newY:Int{
        get{
            return self._newy
        }
        set(newvalue){
            self._newy = newvalue
        }
    }
    
    private var _lastx = -1
    var lastx:Int{
        get{
            return self._lastx
        }
        set(newvalue){
            self._lastx = newvalue
        }
    }
    
    private var _lasty = -1
    var lasty:Int{
        get{
            return self._lasty
        }
        set(newvalue){
            self._lasty = newvalue
        }
    }
    
    deinit {
        _currentPiece    = nil
        _lastkilledPiece = nil
    }
}
