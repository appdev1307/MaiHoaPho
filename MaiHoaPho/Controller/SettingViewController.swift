//
//  SettingViewController.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/30/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == FilePickerCtl{
            return GameSetting.FileCaption.count
        }
        else{
            return GameSetting.GameCaption.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == FilePickerCtl{
            return GameSetting.FileCaption[row]
        }
        else{
            return GameSetting.GameCaption[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       if pickerView == FilePickerCtl{
            GameSetting.FileIndexSelected = row
       }
       else{
            GameSetting.GameIndexSelected = row
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FilePickerCtl.delegate   = self
        FilePickerCtl.dataSource = self
        
        GamePickerCtl.delegate   = self
        GamePickerCtl.dataSource = self
        
        if GameSetting.AudioOn {
            AudioSettingSegCtl.selectedSegmentIndex = 0
        }
        else{
           AudioSettingSegCtl.selectedSegmentIndex = 1
        }
        
        if GameSetting.MusicRepeat {
            MusicRepeatSegCtl.selectedSegmentIndex = 0
        }
        else{
            MusicRepeatSegCtl.selectedSegmentIndex = 1
        }
        
        FilePickerCtl.selectRow(GameSetting.FileIndexSelected, inComponent: 0, animated: true)
        GamePickerCtl.selectRow(GameSetting.GameIndexSelected, inComponent: 0, animated: true)
    }
    
    
    @IBOutlet weak var FilePickerCtl: UIPickerView!
    @IBOutlet weak var GamePickerCtl: UIPickerView!
    
    
    @IBOutlet weak var AudioSettingSegCtl: UISegmentedControl!
    
    @IBAction func AudioChange(_ sender: Any) {
        switch AudioSettingSegCtl.selectedSegmentIndex {
        case 0:
            GameSetting.AudioOn = true
            break
        case 1:
            GameSetting.AudioOn = false
            break
        default:
            GameSetting.AudioOn = false
        }
    }
    
    @IBOutlet weak var MusicRepeatSegCtl: UISegmentedControl!
    @IBAction func MusicRepeatChange(_ sender: Any) {
        switch MusicRepeatSegCtl.selectedSegmentIndex {
        case 0:
            GameSetting.MusicRepeat = true
            break
        case 1:
            GameSetting.MusicRepeat = false
            break
        default:
            GameSetting.MusicRepeat = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveSetting()
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
