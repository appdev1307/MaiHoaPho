//
//  ChessFileHandler.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/13/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation

class ChessFileHandler {
    
    private var mStepNumer = 0
    var StepNumber:Int{
        get{
            return self.mStepNumer
        }
    }
    
    var filecontent: [String]? = nil
    var _fileEnd: Bool = false
    
    var FileEnded: Bool {
        get {
            return self._fileEnd
        }
    }
    
    var fileline = 0
    var fileExisted = false
    
    init(FullName fullname:String) {
        let filename = fullname
        
        if let filepath = Bundle.main.path(forResource: filename, ofType: nil) {
            do {
                let strcontent = try String(contentsOfFile: filepath)
                // Convert whole text into array of String
                filecontent = strcontent.components(separatedBy: "\n")
                fileExisted = true
                
                repeat{
                    let line = filecontent![fileline]
                    fileline = fileline + 1
                    
                    if line.contains("Start"){
                        // Reach the guideline
                        break
                    }
                    
                }while(true)
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
    
    func goNextLine() -> [String]{
        var tmp: String! = nil
        var strReturn: [String] = ["End"] // To avoid nil exception for optional variable
        
        if fileExisted {
            if (_fileEnd == false) &&
               (fileline < (filecontent?.count)!) {
                tmp = filecontent![fileline]
                
                if tmp.contains("End"){
                    _fileEnd = true
                    
                }
                else{
                    let trimmedTmp = tmp.trimmingCharacters(in: NSCharacterSet.whitespaces)
                    strReturn = trimmedTmp.components(separatedBy: " ")
                    mStepNumer = mStepNumer + 1
                    
                    print("MaiHoaPho - " + #function + "Read line: " + trimmedTmp + "\n")
                }
                
                fileline = fileline + 1
            }
            else{
                // Do nothing
            }
        }
        
        return strReturn
    }
    
    func resetHandler(){
        _fileEnd      = false
        fileline     = 0
        filecontent?.removeAll()
    }
}
