//
//  AddToDoViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet private weak var newTextField: UITextField!
    @IBOutlet private weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = 20.0
        newTextField.layer.borderWidth = 2.0
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func addToDo(_ sender: Any) {
        if newTextField.text?.isEmpty != true {
            var todoitems = UserDefaults.standard.array(forKey: "LabToDo")
            todoitems?.append(newTextField.text!)
            UserDefaults.standard.setValue(todoitems, forKey: "LabToDo")
            newTextField.text = ""
            dismiss(animated: true, completion: nil)
        } else {
            return
        }
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
