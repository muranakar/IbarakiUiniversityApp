//
//  AddToDoViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class AddToDoViewController: UIViewController {

    
    @IBOutlet weak var NewTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func AddToDo(_ sender: Any) {
        
        if NewTextField.text?.isEmpty != true {
            var todoitems = UserDefaults.standard.array(forKey: "LaboToDo")
            todoitems?.append(NewTextField.text!)
            UserDefaults.standard.setValue(todoitems, forKey: "LaboToDo")
            NewTextField.text = ""
            dismiss(animated: true, completion: nil)
        }else{
            return
        }
        
        
    }
    
    
}
