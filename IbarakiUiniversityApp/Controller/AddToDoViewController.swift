//
//  AddToDoViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class AddToDoViewController: UIViewController {

    
    @IBOutlet weak var NewTextField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddButton.layer.cornerRadius = 20.0
        NewTextField.layer.borderWidth = 2.0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @IBAction func AddToDo(_ sender: Any) {
        
        if NewTextField.text?.isEmpty != true {
            var todoitems = UserDefaults.standard.array(forKey: "LabToDo")
            todoitems?.append(NewTextField.text!)
            UserDefaults.standard.setValue(todoitems, forKey: "LabToDo")
            NewTextField.text = ""
            dismiss(animated: true, completion: nil)
        }else{
            return
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
