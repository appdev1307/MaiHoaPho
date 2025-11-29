//
//  GameTitleList.swift
//  MaiHoaPho
//
//  Created by ngoctam on 12/15/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import Foundation
//import GoogleMobileAds

class GameTitleList{
    private static var mInitialAdsNum = 0;
    static var InitialAdsNum: Int{
        get{
            return mInitialAdsNum;
        }
        set(newvalue){
            mInitialAdsNum = newvalue;
        }
    }
    
    // MARK: - Data model logic
    private static let mAdTest = false
    static var AdTest: Bool{
        get {
            return mAdTest
        }
    }
    
    static var FileName:[String] {
        get {
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.FileName
            }
            else{
                return GoodGameChinaTitleList.FileName
            }
        }
    }
    
    static func getFileName() -> String {
        if GameSetting.GameIndexSelected == 0{
            return GameMaiHoaPhoTitleList.getFileName()
        }
        else{
            return GoodGameChinaTitleList.getFileName()
        }
    }
    
    static var subSectionNumbers: [Int]{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.subSectionNumbers
            }
            else{
                return GoodGameChinaTitleList.SectionNumbers
            }
        }
    }
    
    static var subSectionName:[String]{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.subSectionName
            }
            else{
                return GoodGameChinaTitleList.SectionName
            }
        }
    }
    
    static var SectionNumbers: [Int]{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.SectionNumbers
            }
            else{
                return GoodGameChinaTitleList.SectionNumbers
            }
        }
    }
    
    static var SectionName:[String]{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.SectionName
            }
            else{
                return GoodGameChinaTitleList.SectionName
            }
        }
    }
    
    static var ResetRequest: Bool{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.ResetRequest
            }
            else{
                return GoodGameChinaTitleList.ResetRequest
            }
        }
    }
    
    static var InternalIndex: Int {
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.InternalIndex
            }
            else{
                return GoodGameChinaTitleList.InternalIndex
            }
        }
        set (newvalue){
            if GameSetting.GameIndexSelected == 0{
                GameMaiHoaPhoTitleList.InternalIndex = newvalue
            }
            else{
                GoodGameChinaTitleList.InternalIndex = newvalue
            }
        }
    }
    
    static var lastTitleRow:Int{
        get{
            if GameSetting.GameIndexSelected == 0{
                return GameMaiHoaPhoTitleList.lastTitleRow
            }
            else{
                return GoodGameChinaTitleList.lastTitleRow
            }
        }
        set (newvalue){
            if GameSetting.GameIndexSelected == 0{
                GameMaiHoaPhoTitleList.lastTitleRow = newvalue
            }
            else{
                GoodGameChinaTitleList.lastTitleRow = newvalue
            }
        }
    }
    
    static var lastTitleSection:Int{
        get{
            if GameSetting.GameIndexSelected == 0 {
                return GameMaiHoaPhoTitleList.lastTitleSection
            }
            else{
                return GoodGameChinaTitleList.lastTitleSection
            }
        }
        set (newvalue){
            if GameSetting.GameIndexSelected == 0 {
                GameMaiHoaPhoTitleList.lastTitleSection = newvalue
            }
            else{
                GoodGameChinaTitleList.lastTitleSection = newvalue
            }
        }
    }
    
     static var TreeLevel: Int{
        get{
            if GameSetting.GameIndexSelected == 0 {
                return GameMaiHoaPhoTitleList.TreeLevel
            }
            else{
                return GoodGameChinaTitleList.TreeLevel
            }
        }
    }
    
}
