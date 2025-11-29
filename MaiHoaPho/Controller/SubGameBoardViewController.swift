//
//  SubGameBoardViewController.swift
//  MaiHoaPho
//
//  Created by ngoctam on 8/31/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit
import AVFoundation

class SubGameBoardViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    let GridX = 0
    let GridY = 29
    
    let CellHight = 35
    let CellWidth = 35
    
    var GridXstart:Double = 00.00
    var GridYStart:Double = 00.00
    
    // Background layer
    var bckground = CALayer()
    
    var boardlayer = CALayer()
    
    // Game grid to store chess pieces
    var gamegrid: GameGrid? = nil
    
    // Title of mai hoa pho to display
    
    // It indicates that the first initialization has been done
    var bfirstinit = false
    
    func getlayer() -> CALayer{
        return self.view.layer
    }
    
    func gotoPrev(){
        if gamegrid != nil{
            gamegrid?.goPrevious()
        }
    }
    
    func gotoNext(){
        if gamegrid != nil{
            gamegrid?.gotoNext1()
        }
    }
    
    
    func doReset(){
        bfirstinit = false
        
        // Do resource clearance from grid
        gamegrid?.doReset()
        
        // remove all calayer
        boardlayer.removeFromSuperlayer()
        gamegrid?.removeFromSuperlayer()
        
        // Initialization again
        doFirstInit()
    }
    
    func doFirstInit(){
        
        if bfirstinit == false {
            let boardimage = UIImage(named: "WOOD.png")
            
            // Loading image without any scaling ratio
            var wdelta = self.view.bounds.size.width - (boardimage?.size.width)!
            var hdelta = self.view.bounds.size.height - (boardimage?.size.height)!
            
            if wdelta < 0 {
                wdelta = 0
            }
            else{
                wdelta = wdelta / 2
            }
            
            if hdelta < (boardimage?.size.height)! {
                hdelta = 0
            }
            else{
                hdelta = hdelta / 5
            }
            boardlayer.frame = CGRect(x: wdelta, y: hdelta, width: (boardimage?.size.width)!, height: (boardimage?.size.height)!)
            
            boardlayer.contents = boardimage?.cgImage
            boardlayer.contentsGravity = CALayerContentsGravity.center
            
            // Initialize game grid for setting chess pieces
            gamegrid = GameGrid()
            
            gamegrid?.chessHandlerInit(FileName: GameTitleList.getFileName())
            
            // Anchor point of the grid
            gamegrid?.doInit(X: (GridX + Int(wdelta)), y: (GridY + Int(hdelta)), cellheight: CellHight, cellwidth: CellWidth)
            
            // Add Game board as one sub-layer
            getlayer().addSublayer(boardlayer)
            getlayer().addSublayer(gamegrid!)
            
            bfirstinit = true
        }
        else{
            // Do nothing
        }
    }
    
    func doPlayMusic() {
        if GameSetting.AudioOn {
            do {
                if let fileURL = Bundle.main.path(forResource: GameSetting.FileName[GameSetting.FileIndexSelected], ofType: "mp3") {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                    
                    if GameSetting.MusicRepeat {
                        audioPlayer?.numberOfLoops = -1
                    }
                    else{
                        audioPlayer?.numberOfLoops = 1
                    }
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()
                } else {
                    print("No file with specified name exists")
                }
            } catch let error {
                print("Can't play the audio file failed with an error \(error.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.clipsToBounds = true
        
        let image = UIImage(named: "coffee.jpg")
        bckground.contents = image?.cgImage
        bckground.contentsGravity = CALayerContentsGravity.center
        getlayer().addSublayer(bckground)
        
        // Music
        doPlayMusic()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
