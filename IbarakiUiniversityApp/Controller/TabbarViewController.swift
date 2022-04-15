//
//  TabbarViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

enum TabBarItems {
    case submitDocument
    case labTodo
    case portal
    case manaba
}

class TabbarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
    }
}
