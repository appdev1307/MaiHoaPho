//
//  MainGameViewController.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/3/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit
// import GoogleMobileAds
import AVFoundation

import MoPub

class MainGameViewController: UIViewController, MPAdViewDelegate {
    @IBOutlet weak var mtoolbar: UIToolbar!
    @IBOutlet weak var uiMaiHoaPho: UIImageView!
    
    // MARK: - MOPUB
    var mMopubBannerAdView : MPAdView?
    
    let mMopubBannerID      = "c00a041766ee43b09e6c5eb697166d7b"
    let mMopubBannerTestID  = "0ac59b0996d947309c33f59d6676399f"
    
    func addMopubBannerToView() {
        var topSafeArea: CGFloat
        
        if #available(iOS 11.0, *) {
          topSafeArea = view.safeAreaInsets.top
        } else {
          topSafeArea = topLayoutGuide.length
        }
        
        if (!GameTitleList.AdTest){
            mMopubBannerAdView = MPAdView.init(adUnitId: mMopubBannerID)
        }
        else{
            mMopubBannerAdView = MPAdView.init(adUnitId: mMopubBannerTestID)
        }
        
        mMopubBannerAdView?.delegate = self;
        mMopubBannerAdView?.frame = CGRect(x:0, y: topSafeArea,
                                           width: view.frame.width, height:50)
        
        self.view.addSubview(self.mMopubBannerAdView!)
        mMopubBannerAdView?.loadAd()
    }
    
    func adViewDidLoadAd(_ view: MPAdView!) {
        NSLog("MOPUB " + #function)
    }

    func  adViewDidFail(toLoadAd view: MPAdView!) {
        NSLog("MOPUB " + #function)
    }

    func viewControllerForPresentingModalView() -> UIViewController! {
        NSLog("MOPUB " + #function)
        return self
    }

    func willPresentModalView(forAd view: MPAdView!) {
        NSLog("MOPUB " + #function)
    }

    func didDismissModalView(forAd view: MPAdView!) {
        NSLog("MOPUB " + #function)
    }

    func willLeaveApplication(fromAd view: MPAdView!) {
        NSLog("MOPUB " + #function)
    }

    
    // Mark: - Google Ads mobile
    /*
    var adBannerView = GameTitleList.adBannerView
    
    let mTestDeviceID = "d6e8998f3453654773dd3d83fc2e0d7fb3373656"
    let mAdmobTest = true
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        adBannerView.isHidden       = false
        uiMaiHoaPho.layer.zPosition = -1
        //UIApplication.shared.keyWindow?.addSubview(adBannerView)
    }
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        adBannerView.isHidden   = true
        uiMaiHoaPho.layer.zPosition = 0
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
    
    /// Tells the delegate an ad request succeeded.
    internal func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        print("interstitialWillLeaveApplication")
    }
    
    func addBannerToView() {
        
        // First load request
        let newSafeArea = view.safeAreaInsets
        adBannerView.adSize = kGADAdSizeSmartBannerPortrait
        adBannerView.rootViewController = self
        adBannerView.translatesAutoresizingMaskIntoConstraints = false
        adBannerView.frame = CGRect(x: 0.0,
                                    y: newSafeArea.top,
                                    width: view.frame.width,
                                    height: adBannerView.frame.height)
        
        view.addSubview(adBannerView)
        
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            adBannerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        }
        else {
            NSLayoutConstraint(item: adBannerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        }
        
        if(!mAdmobTest)
        {
            adBannerView.adUnitID = "ca-app-pub-3373009035938513/7682646766" // MaiHoaPho Ads unit
        }
        else
        {
            adBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" // Test Ads unit
        
        }
        adBannerView.delegate = self
        
        // Request Google Adsmob
        let request: GADRequest = GADRequest()
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers =  [mTestDeviceID]

        if (GameTitleList.InitialAdsNum == 0)
        {
            // Auto refresh configured in AdMob Unit, do not load the load many times,
            adBannerView.load(request)
        }
    }
  */
    
    var msubgameboard: SubGameBoardViewController? = nil
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        if msubgameboard != nil{
            msubgameboard?.gotoPrev()
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if msubgameboard != nil{
            msubgameboard?.gotoNext()
        }
    }
    
    @IBAction func RestartButtonTapped(_ sender: Any) {
        if msubgameboard != nil{
            msubgameboard?.doReset()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Prepare Audio Session
        do{
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setActive(true)
        }
        catch{
            
        }
        // It is stop overlaying of navigation bar
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // It is called many times, so we could not use it in adding new uiview
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        // safe area values are now available to use
         
        // Mark: - Mopub
        addMopubBannerToView()
    }
    
    override func viewDidAppear(_ animated: Bool){
        GameTitleList.InitialAdsNum = GameTitleList.InitialAdsNum + 1
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameBoard"{
            let gameboard = segue.destination as! SubGameBoardViewController
            
            // To do initialization
            gameboard.doFirstInit()
            msubgameboard = gameboard
        }
        else if let gametitlelist = segue.destination as? GameListViewController{
            gametitlelist.delegate = self
        }
    }
}

extension MainGameViewController: ModalViewControllerDelegate {
    func dismissed() {
        
        if GameTitleList.ResetRequest {
            if msubgameboard != nil{
                // Do reset
                msubgameboard?.doReset()
                
                // Save persistant data
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.saveSetting()
            }
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
