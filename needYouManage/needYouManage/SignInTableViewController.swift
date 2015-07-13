//
//  SignInTableViewController.swift
//  needYouManage
//
//  Created by lvlinqing on 15/7/13.
//  Copyright (c) 2015年 needYouManage. All rights reserved.
//

import UIKit

class SignInTableViewController: UITableViewController {
  
    @IBAction func switchAction(sender: AnyObject) {
        let uiSwitch = sender as! UISwitch
    
    }
 
    var habitType:HabitType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = habitType?.typeName

    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dataFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd"
        var data = NSDate()
        return dataFormatter.stringFromDate(data)
    }



}
