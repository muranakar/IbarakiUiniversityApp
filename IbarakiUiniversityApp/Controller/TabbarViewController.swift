//
//  TabbarViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class TabbarViewController: UITabBarController {
    var documentitems = [String]()
    var toDoitems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedIndex = 0
        // error回避
        if UserDefaults.standard.array(forKey: "SubmitDocuments") == nil {
            UserDefaults.standard.setValue([], forKey: "SubmitDocuments")
        }

        if UserDefaults.standard.array(forKey: "LabToDo") == nil {
            UserDefaults.standard.setValue([], forKey: "LabToDo")
        }
        documentitems = UserDefaults.standard.array(forKey: "SubmitDocuments") as? [String] ?? [""]
        toDoitems = UserDefaults.standard.array(forKey: "LabToDo") as? [String] ?? [""]

        let documenttab: UITabBarItem = self.tabBar.items![0]
        let toDotab: UITabBarItem = self.tabBar.items![1]

        if documentitems.count == 0 {
            documenttab.badgeValue = nil
        } else {
            documenttab.badgeValue = String(documentitems.count)
        }

        if toDoitems.count == 0 {
            toDotab.badgeValue = nil
        } else {
            toDotab.badgeValue = String(toDoitems.count)
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        documentitems = UserDefaults.standard.array(forKey: "SubmitDocuments") as? [String] ?? [""]
        toDoitems = UserDefaults.standard.array(forKey: "LabToDo") as? [String] ?? [""]

        let documenttab: UITabBarItem = self.tabBar.items![0]
        let toDotab: UITabBarItem = self.tabBar.items![1]

        if documentitems.count == 0 {
            documenttab.badgeValue = nil
        } else {
            documenttab.badgeValue = String(documentitems.count)
        }

        if toDoitems.count == 0 {
            toDotab.badgeValue = nil
        } else {
            toDotab.badgeValue = String(toDoitems.count)
        }
    }
}
