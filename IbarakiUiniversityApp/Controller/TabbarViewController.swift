//
//  TabbarViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class TabbarViewController: UITabBarController {
    private var documentitems = [String]()
    private var toDoitems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
    }
}
