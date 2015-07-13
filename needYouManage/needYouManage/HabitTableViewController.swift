//
//  HabitTableViewController.swift
//  needYouManage
//
//  Created by 林青 吕 on 15/7/12.
//  Copyright (c) 2015年 needYouManage. All rights reserved.
//

import UIKit

class HabitTableViewController: UITableViewController {
    
    var dataSource:[HabitType]?


    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
    }
    
    func initData(){
//        var path = NSBundle.mainBundle().pathForResource("habit", ofType: "plist")
//        var datas = NSDictionary(contentsOfFile: path!)! as Dictionary
//        dataSource = [String]()
//        for key in datas.keys{
//            dataSource?.append(key as! String)
//        }
        dataSource = [HabitType]()
        let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
        if let rs = appDelegate.getDb().executeQuery("SELECT * FROM habit", withArgumentsInArray: nil) {
            while rs.next() {
             let habitType = HabitType()
                habitType.typeId = rs.intForColumn("id")
                habitType.typeName = rs.stringForColumn("typeName")
                dataSource!.append(habitType)
            }
        } else {
        
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataSource!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let habitType  = dataSource![indexPath.row]
         cell.textLabel?.text = habitType.typeName
       
        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    //位置交换 回调
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 
        let viewController = segue.destinationViewController as! SignInTableViewController
         let indexPath = self.tableView.indexPathForSelectedRow()
        viewController.habitType = dataSource![indexPath!.row
]
        
    }
 

}
