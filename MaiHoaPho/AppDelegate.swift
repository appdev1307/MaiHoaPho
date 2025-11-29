//
//  AppDelegate.swift
//  MaiHoaPho
//
//  Created by ngoctam on 8/29/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit
import CoreData
// import GoogleMobileAds
import AVFoundation
import Firebase
import os.log

import MoPub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Audio session setting
        do{
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: .defaultToSpeaker)
        }
        catch{
            
        }
        
        // Load setting from persisten storage
        gamesetting = loadMeals()!
        
        //FirebaseApp.configure()
        
        // MARK: - Google Admobs
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // MARK: - MOPUB
        let sdkConfig = MPMoPubConfiguration(adUnitIdForAppInitialization: "c00a041766ee43b09e6c5eb697166d7b")
        sdkConfig.loggingLevel = .info
        MoPub.sharedInstance().initializeSdk(with: sdkConfig) {
            NSLog("SDK initialization complete")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MaiHoaPho")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Persistent storage object
    private var gamesetting = GameSetting()
    
    func saveSetting() {
        let settings = [gamesetting]
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(settings, toFile: GameSetting.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("MaiHoaPho: setting successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("MaiHoaPho: Failed to save setting...", log: OSLog.default, type: .error)
        }
    }
    
    func loadMeals() -> GameSetting?  {
        let settings = NSKeyedUnarchiver.unarchiveObject(withFile: GameSetting.ArchiveURL.path) as? [GameSetting]
        
        if (settings?[0]) != nil{
            return settings?[0]
        }
        else{
            return gamesetting
        }
    }

}

