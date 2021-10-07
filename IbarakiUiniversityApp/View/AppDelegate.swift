//
//  AppDelegate.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
            }
        }
        if UserDefaults.standard.array(forKey: "SubmitDocuments") == nil{
            UserDefaults.standard.setValue([], forKey: "SubmitDocuments")
        }
        
        if UserDefaults.standard.array(forKey: "LabToDo") == nil{
            UserDefaults.standard.setValue([], forKey: "LabToDo")
        }
        
        
        let documents = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
        let todo = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        let number:Int = documents.count + todo.count

        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge], categories: nil))
        application.applicationIconBadgeNumber = number
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
 
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        let documents = UserDefaults.standard.array(forKey: "Documents") as! [String]
        let todo = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        let number:Int = documents.count + todo.count
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge], categories: nil))
        application.applicationIconBadgeNumber = number
    }
    



}

extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        // アプリ起動時も通知を行う
        completionHandler([ .badge, .sound, .alert ])
    }
}

