//
//  AppDelegate.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UserDefaults.standard.register(defaults: ["SubmitDocumentItems": ["1",
                                                                          "2",
                                                                          "3"]])
        
        let subumitdocumentsview = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! DocumentsListViewController
        //let lavview = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! LabViewController
        
        let submitdocumentmodel = SubmitDocumentModel()
        //let labtodopresentermodel = LabToDoModel()
        
        let submitdocumentpresenter = SubmitDocumentPresenter(view: subumitdocumentsview, model: submitdocumentmodel)
        //let labtodopresenter = LabToDopresenter(view: lavview, model: labtodopresentermodel)
        
       subumitdocumentsview.inject(presenter: submitdocumentpresenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = subumitdocumentsview
        window?.makeKeyAndVisible()
        
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


}

