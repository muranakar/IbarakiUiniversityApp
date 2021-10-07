//
//  AddDocumentViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit

class AddDocumentViewController: UIViewController {

    @IBOutlet weak var newDocument: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func AddDocument(_ sender: Any) {
        
        if newDocument.text?.isEmpty != true{
            var items = UserDefaults.standard.array(forKey: "Documents")
            items?.append(newDocument.text!)
            UserDefaults.standard.setValue(items, forKey: "Documents")
            newDocument.text = ""
            dismiss(animated: true, completion: nil)
            
        }else{
            return
        }
    }
}


