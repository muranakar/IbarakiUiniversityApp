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
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddButon.layer.cornerRadius = 20.0
        newDocument.layer.borderWidth = 2.0
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func AddDocument(_ sender: Any) {
        
        if newDocument.text?.isEmpty != true{
            var items = UserDefaults.standard.array(forKey: "SubmitDocuments")
            //var date = UserDefaults.standard.array(forKey: "SubmitDate")
            print(DatePicker.date)
            items?.append(newDocument.text!)
            //date?.append(DatePicker.date)
            UserDefaults.standard.setValue(items, forKey: "SubmitDocuments")
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


