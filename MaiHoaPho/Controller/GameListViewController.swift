//
//  GameListViewController.swift
//  MaiHoaPho
//
//  Created by ngoctam on 9/16/18.
//  Copyright © 2018 ngoctam. All rights reserved.
//

import UIKit

protocol ModalViewControllerDelegate:AnyObject {
    func dismissed()
}

class GameListViewController: UITableViewController {
    
    var delegate: ModalViewControllerDelegate?
    
    private var lastTitleRow     = 0
    private var lastTitleSection = 0
    
    func getIndexOfItemsinSection( section: Int) -> Int{
        // Applied in only level 3
        var startindex  = 0;
        
        for i in 0..<(section)
        {
            startindex = startindex + GameTitleList.SectionNumbers[i]
        }
        
        return startindex
    }
    
    func getIndexOfItemsinSection( section: Int, partindex: inout Int) -> Int{
        // Applied in only level 3
        var startindex  = 0;
        partindex       = 0
        
        for i in 0..<(section)
        {
            for j in 0..<(GameTitleList.SectionNumbers[i])
            {
                partindex =  partindex + GameTitleList.subSectionNumbers[startindex + j] // calculation not correct --> to be updated
            }
            
            startindex = startindex + GameTitleList.SectionNumbers[i] // failed
        }
        
        return startindex
    }
    
    func isSubSectionHeader(section: Int, row: Int, startindex: Int, partindex: inout Int) -> Bool{
        partindex = 0 // Initialize
        if row == 0{
            return true
        }
        
        // Applied in only level 3
        let sectionnum =  GameTitleList.SectionNumbers[section]
        
        var index = 0
        for i in 0..<(sectionnum){
            if row == index
            {
                partindex = i
                // This is sub-section item
                return true
            }
            
            let totalRow = GameTitleList.subSectionNumbers[startindex + i]
            for j in 0..<(totalRow){
                index = index + 1
                if row == index
                {
                    partindex = j
                    // This is part item
                    return false
                }
            }
            
            index = index + 1
        }
        
        // Do not expect to come to this point
        return false
    }
    
    func  fileNameindextGet(section: Int, row: Int, partindex: inout Int) -> Bool{
        if row == 0{
            // This is sub-section item
            partindex = 0
            return true
        }
        
        // Applied in only level 3
        let startindex = getIndexOfItemsinSection(section: section, partindex: &partindex)
        let sectionnum =  GameTitleList.SectionNumbers[section]
        
        var index = 0
        for i in 0..<(sectionnum){
            if row == index
            {
                // This is sub-section item
                partindex = 0
                return true
            }
            
            let totalRow = GameTitleList.subSectionNumbers[startindex + i]
            for j in 0..<(totalRow){
                index       = index + 1
                
                if row == index
                {
                    // This is part item
                    partindex   = partindex + j
                    return false
                }
            }
            
            partindex   = partindex + totalRow
            index       = index + 1
        }
        
        // Do not expect to come to this point
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var tmprow = 0
        if GameTitleList.TreeLevel == 3{
            if fileNameindextGet(section: indexPath.section, row: indexPath.row, partindex: &tmprow)
            {
                // Do not display context menu for sub-section item
                return
            }
            else
            {
                // Do nothing here
            }
        }
        else{
            tmprow = indexPath.row
        }
        
        
        
        let playActionHandler = { (action: UIAlertAction!) -> Void in
            GameTitleList.InternalIndex    = tmprow
            GameTitleList.lastTitleSection = indexPath.section
            GameTitleList.lastTitleRow     = indexPath.row // This is not correct logic
            
            self.dismiss(animated: true, completion: nil)//dismiss the presented view controller
            self.delegate?.dismissed()
        }
        
        let returnActionHandler = { (action: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)//dismiss the presented view controller
        }
        
        let optionMenu = UIAlertController(title: nil, message: "Select a title and play", preferredStyle: .actionSheet)
        
        // Play action
        let playAction = UIAlertAction(title: "Select the title", style: .default, handler: playActionHandler)
        optionMenu.addAction(playAction)
        
        // Return action
        let retrunAction = UIAlertAction(title: "Back to the current", style: .default, handler: returnActionHandler)
        optionMenu.addAction(retrunAction)
        
        // Cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        // Present the context menu
        present(optionMenu, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if GameTitleList.TreeLevel == 3{
            return GameTitleList.SectionName.count
        }
        else{
            return 1 // Only one level supported
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if GameTitleList.TreeLevel == 3{
            let label = UILabel()
            
            // It is used to support variable lenght of text in a label by using multiline
            label.numberOfLines   = 0
            label.backgroundColor = UIColor.cyan
            label.text            = "Chương " + String(section + 1) + ": " + GameTitleList.SectionName[section]
            
            return label
        }
        else{
            return nil
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return GameTitleList.FileName.count
        if GameTitleList.TreeLevel == 3
        {
            let sectionnum =  GameTitleList.SectionNumbers[section]
            let startindex = getIndexOfItemsinSection(section: section)
            
            var totalRow = 0
            for i in 0...(sectionnum - 1) {
                totalRow = totalRow + GameTitleList.subSectionNumbers[startindex + i]
            }
            
            return totalRow + sectionnum
            // SubSection can be expandable. So, we don't consider the number of parts in this returned value.
        }
        else
        {
            return GameTitleList.SectionNumbers[section]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = "GameTitle"
        var displayText = ""
        
        if GameTitleList.TreeLevel == 3
        {
            let section    = indexPath.section
            let subsection = indexPath.row
            
            var pindex = 0
            let startindex = getIndexOfItemsinSection(section: section)
            
            if isSubSectionHeader(section: section, row: subsection, startindex: startindex, partindex: &pindex)
            {
                displayText = "Cục " + String(pindex + 1) + " : " + GameTitleList.subSectionName[startindex + pindex]
            }
            else{
                cellIdentifier = "GamePart"
                // Display part number in each sub-section
                displayText = "Phần " + String(pindex + 1)
            }
        }
        else
        {
            // Only 1 level tree supported
            displayText = "Phần " + String(indexPath.row + 1) + " : " + GameTitleList.SectionName[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = displayText
    
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let rowToSelect = NSIndexPath(row: GameTitleList.lastTitleRow, section: GameTitleList.lastTitleSection)  
        self.tableView.selectRow(at: rowToSelect as IndexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // It is used to support variable lenght of text in a label by using multiline
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
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
