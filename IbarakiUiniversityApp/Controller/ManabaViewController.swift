//
//  ManabaViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import WebKit

class ManabaViewController: UIViewController {
    @IBOutlet private weak var webview: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://manaba.ibaraki.ac.jp/") {
            self.webview.load(URLRequest(url: url))
        }
    }

    @IBAction private func reloadButton(_ sender: Any) {
        webview.reload()
    }
}
