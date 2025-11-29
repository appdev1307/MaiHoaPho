//
//  GameSetting.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/30/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//  Purpose: This is persistent data storage manager
//

import Foundation
import os.log

class GameSetting: NSObject, NSCoding{
    
    override init() {
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        // Int - Game Title for Mai Hoa Pho
        aCoder.encode(GameMaiHoaPhoTitleList.InternalIndex, forKey: PropertyKey.lasttile_maihoapho)
        
        // Int - Game Title for Mai Hoa Pho
        aCoder.encode(GameMaiHoaPhoTitleList.lastTitleSection, forKey: PropertyKey.lastsection_maihoapho)
        
        // Int - Game Title for Mai Hoa Pho
        aCoder.encode(GameMaiHoaPhoTitleList.lastTitleRow, forKey: PropertyKey.lastrow_maihoapho)
        
        
        // Int - Game Title for Good game
        aCoder.encode(GoodGameChinaTitleList.InternalIndex, forKey: PropertyKey.lasttile_goodgame)
        
        // Int - Game Title for Good game
        aCoder.encode(GoodGameChinaTitleList.lastTitleSection, forKey: PropertyKey.lastsection_goodgame)
        
        // Int - Game Title for Good game
        aCoder.encode(GoodGameChinaTitleList.lastTitleRow, forKey: PropertyKey.lastrow_goodgame)
        
        
        // Bool - Game Setting
        aCoder.encode(GameSetting.AudioOn, forKey: PropertyKey.audion)
        
        // Bool - Game Setting
        aCoder.encode(GameSetting.MusicRepeat, forKey: PropertyKey.audiorepeat)
        
        // Int - Game Setting
        aCoder.encode(GameSetting.FileIndexSelected, forKey: PropertyKey.fileindex)
        
        // Int - Game Selection
        aCoder.encode(GameSetting.GameIndexSelected, forKey: PropertyKey.gameselection)
        
        // Int - Ads request
        aCoder.encode(GameTitleList.InitialAdsNum, forKey: PropertyKey.AdsRequest)
    }
    
    required init(coder aDecoder: NSCoder) {
        // Must call designated initializer.
        super.init()
        
        //MARK: Game title specific setting storage persistent manager
        // Comeback to the last title played previously.
        // MARK: Mai Hoa Pho
        if aDecoder.containsValue(forKey: PropertyKey.lasttile_maihoapho){
            let lasttile = aDecoder.decodeCInt(forKey: PropertyKey.lasttile_maihoapho)
            GameMaiHoaPhoTitleList.InternalIndex = Int(lasttile)
        }
        else{
            GameMaiHoaPhoTitleList.InternalIndex = 0
        }
        
        if aDecoder.containsValue(forKey: PropertyKey.lastsection_maihoapho){
            let tmp = aDecoder.decodeCInt(forKey: PropertyKey.lastsection_maihoapho)
            GameMaiHoaPhoTitleList.lastTitleSection = Int(tmp)
        }
        else{
            GameMaiHoaPhoTitleList.lastTitleSection = 0
        }
        
        if aDecoder.containsValue(forKey: PropertyKey.lastrow_maihoapho){
            let tmp = aDecoder.decodeCInt(forKey: PropertyKey.lastrow_maihoapho)
            GameMaiHoaPhoTitleList.lastTitleRow = Int(tmp)
        }
        else{
            GameMaiHoaPhoTitleList.lastTitleRow = 0
        }
        
        // MARK: Good game
        if aDecoder.containsValue(forKey: PropertyKey.lasttile_goodgame){
            let lasttile = aDecoder.decodeCInt(forKey: PropertyKey.lasttile_goodgame)
            GoodGameChinaTitleList.InternalIndex = Int(lasttile)
        }
        else{
            GoodGameChinaTitleList.InternalIndex = 0
        }
        
        if aDecoder.containsValue(forKey: PropertyKey.lastsection_goodgame){
            let tmp = aDecoder.decodeCInt(forKey: PropertyKey.lastsection_goodgame)
            GoodGameChinaTitleList.lastTitleSection = Int(tmp)
        }
        else{
            GoodGameChinaTitleList.lastTitleSection = 0
        }
        
        if aDecoder.containsValue(forKey: PropertyKey.lastrow_goodgame){
            let tmp = aDecoder.decodeCInt(forKey: PropertyKey.lastrow_goodgame)
            GoodGameChinaTitleList.lastTitleRow = Int(tmp)
        }
        else{
            GoodGameChinaTitleList.lastTitleRow = 0
        }
        
        
        //MARK: Game setting storage persistent manager
        // The audio on is required.
        if aDecoder.containsValue(forKey: PropertyKey.audion){
            let audion = aDecoder.decodeBool(forKey: PropertyKey.audion)
            GameSetting.AudioOn = audion
        }
        else {
            GameSetting.AudioOn = true
        }
        
        // The audio repeat is required.
        if aDecoder.containsValue(forKey: PropertyKey.audiorepeat){
            let audiorepeat = aDecoder.decodeBool(forKey: PropertyKey.audiorepeat)
            GameSetting.MusicRepeat = audiorepeat
        }
        else {
            GameSetting.MusicRepeat = true
        }
        
        // The file index is required.
        if aDecoder.containsValue(forKey: PropertyKey.fileindex){
            let fileindex = aDecoder.decodeCInt(forKey: PropertyKey.fileindex)
            GameSetting.FileIndexSelected = Int(fileindex)
        }
        else{
            GameSetting.FileIndexSelected = 0
        }
        
        // The game selection is required.
        if aDecoder.containsValue(forKey: PropertyKey.gameselection){
            let gameindex = aDecoder.decodeCInt(forKey: PropertyKey.gameselection)
            GameSetting.GameIndexSelected = Int(gameindex)
        }
        else{
            GameSetting.GameIndexSelected = 0
        }
        
        // The Ads request number.
        /*if aDecoder.containsValue(forKey: PropertyKey.AdsRequest){
            let AdsRequest = aDecoder.decodeCInt(forKey: PropertyKey.AdsRequest)
            GameTitleList.InitialAdsNum = Int(AdsRequest)
        }
        else{
            GameTitleList.InitialAdsNum = 0
        }*/
        GameTitleList.InitialAdsNum = 0
    }
    
    //MARK: Types
    struct PropertyKey{
        static let lasttile_maihoapho         = "LastTitle_maihoapho"
        static let lastsection_maihoapho      = "LastSection_maihoapho"
        static let lastrow_maihoapho          = "LastRow_maihoapho"
        static let lasttile_goodgame         = "LastTitle_goodgame"
        static let lastsection_goodgame      = "LastSection_goodgame"
        static let lastrow_goodgame          = "LastRow_goodgame"
        static let audion           = "AudioOn"
        static let audiorepeat      = "AudioRepeat"
        static let fileindex        = "fileindex"
        static let gameselection    = "gameselection"
        
        static let AdsRequest    = "AdsRequest"
    }
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("MaiHoaPho")
    
    // MARK: Static method to update data from view controller
    private static var mFileCaption = [
        "eine kleine nachtmusik - Mozart",
        "Đa tạ",
        "Con đường xưa em đi"]
    static var FileCaption:[String]{
        get{
            return self.mFileCaption
        }
    }
    
    private static var mFileName = [
    "eine_kleine_nachtmusik",
    "Data",
    "ConDuongXuaEmDi"]
    static var FileName:[String] {
        get{
            return self.mFileName
        }
    }
    
    private static var mFileIndexSelected = 0
    static var FileIndexSelected: Int{
        get{
            return self.mFileIndexSelected
        }
        set (newvalue){
            self.mFileIndexSelected = newvalue
        }
    }
    
    private static var mAudioOn = true
    static var AudioOn: Bool{
        get{
            return self.mAudioOn
        }
        set(newvalue){
            self.mAudioOn = newvalue
        }
    }
    
    private static var mMusicRepeat = true
    static var MusicRepeat: Bool{
        get{
                return self.mMusicRepeat
        }
        set {
                self.mMusicRepeat = newValue
        }
    }
    
    // MARK: Static method to update data from view controller
    private static var mGameCaption = [
        "Mai Hoa Phổ",
        "Những nước cờ hay",
        ]
    static var GameCaption:[String]{
        get{
            return self.mGameCaption
        }
    }
    
    private static var mGameIndexSelected = 0
    static var GameIndexSelected: Int{
        get{
            return self.mGameIndexSelected
        }
        set (newvalue){
            if newvalue >= mGameCaption.count {
                self.mGameIndexSelected = mGameCaption.count - 1
            }
            else if newvalue < 0 {
                self.mGameIndexSelected = 0
            }
            else{
                self.mGameIndexSelected = newvalue
            }
        }
    }
}
