//
//  HabitNoteViewController.swift
//  needYouManage
//
//  Created by lvlinqing on 15/7/13.
//  Copyright (c) 2015年 needYouManage. All rights reserved.
//

import UIKit

class HabitNoteViewController: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {
   
    @IBOutlet weak var noteText: UITextView!
    var actionSheet:UIActionSheet?
    var db:FMDatabase?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        let rightItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Done, target: self, action:Selector("save"))
        self.navigationItem.rightBarButtonItem = rightItem
        noteText.delegate = self
       let appDelegate  = UIApplication.sharedApplication().delegate as! AppDelegate
       db = appDelegate.getDb()
    }
    
    func save(){
     self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getPhoto(sender: AnyObject) {
        noteText.resignFirstResponder()
        if (actionSheet == nil){
         actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "拍照","从相册选择")
        }
        
        actionSheet!.showInView(self.view)
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex
        {
        
        case 1:
            toPicker(UIImagePickerControllerSourceType.Camera)
        case 2:
            toPicker(UIImagePickerControllerSourceType.PhotoLibrary)
        default:
            break
        }
    }
    
    func toPicker(sourceType:UIImagePickerControllerSourceType){
        
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = self
        self.presentViewController(pickerController, animated: true, completion: {println("草泥马")})
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if (text == "\n"){
            noteText.resignFirstResponder()
            return false
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
