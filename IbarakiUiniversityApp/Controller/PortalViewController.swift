//
//  PortalViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import WebKit

class PortalViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://idc.ibaraki.ac.jp/portal/"){
            self.webview.load(URLRequest(url: url))
        }
        
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        
        webview.reload()
    }
    

}
