//
//  TabbarViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    var Documentitems = [String]()
    var ToDoitems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 0
        //error回避
        if UserDefaults.standard.array(forKey: "SubmitDocuments") == nil{
            UserDefaults.standard.setValue([], forKey: "SubmitDocuments")
        }
        
        if UserDefaults.standard.array(forKey: "LabToDo") == nil{
            UserDefaults.standard.setValue([], forKey: "LabToDo")
        }
        Documentitems = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
        ToDoitems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        
        let Documenttab: UITabBarItem = self.tabBar.items![0]
        let ToDotab: UITabBarItem = self.tabBar.items![1]
        
        if Documentitems.count == 0 {
            Documenttab.badgeValue = nil
        }else{
            Documenttab.badgeValue = String(Documentitems.count)
        }
        
        if ToDoitems.count == 0 {
            ToDotab.badgeValue = nil
        }else{
            ToDotab.badgeValue = String(ToDoitems.count)
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        Documentitems = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
        ToDoitems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        let Documenttab: UITabBarItem = self.tabBar.items![0]
        let ToDotab: UITabBarItem = self.tabBar.items![1]
        
        if Documentitems.count == 0 {
            Documenttab.badgeValue = nil
        }else{
            Documenttab.badgeValue = String(Documentitems.count)
        }
        
        if ToDoitems.count == 0 {
            ToDotab.badgeValue = nil
        }else{
            ToDotab.badgeValue = String(ToDoitems.count)
        }
    }

}
