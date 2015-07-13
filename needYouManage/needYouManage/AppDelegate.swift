//
//  AppDelegate.swift
//  needYouManage
//
//  Created by 林青 吕 on 15/7/12.
//  Copyright (c) 2015年 needYouManage. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var db:FMDatabase?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        openDb()
        createTable()
        return true
    }
    
    func openDb(){
        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let sqlitePath = rootPath.stringByAppendingPathComponent(SQLITE_NAME);
        db = FMDatabase(path:sqlitePath)
        if !db!.open(){
            return
        }
    }
    
    //创建表
    func createTable(){
        if db!.executeUpdate(CREATE_HABIT_TABLE, withArgumentsInArray: nil){
            var path = NSBundle.mainBundle().pathForResource("habit", ofType: "plist")
            var datas = NSDictionary(contentsOfFile: path!)! as Dictionary
            for key in datas.keys{
            db!.executeUpdate("INSERT INTO habit(typeName) VALUES(?)", withArgumentsInArray: [key])
            }
        }
        db!.executeUpdate(CREATE_HABIT_NOTES, withArgumentsInArray: nil)
        
    }
    
    // 获取DB 对象
    func getDb()->FMDatabase{
        return db!
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        //关闭数据库
        db!.close()
    }


}

