//
//  AddDocumentViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit

class AddDocumentViewController: UIViewController {
    

    @IBOutlet weak var newDocument: UITextField!
    @IBOutlet weak var AddButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddButon.layer.cornerRadius = 20.0
        
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
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


