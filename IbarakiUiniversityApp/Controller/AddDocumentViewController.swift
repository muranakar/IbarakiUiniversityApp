//
//  AddDocumentViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit

class AddDocumentViewController: UIViewController {
    @IBOutlet weak var newDocument: UITextField!
    @IBOutlet weak var addButon: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!

    struct submitDocument {
        var documentName: String
        var submitDate: Date
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        uiSetting()

        addButon.layer.cornerRadius = 20.0
        newDocument.layer.borderWidth = 2.0
    }

    func uiSetting () {
        addButon.layer.cornerRadius = 5.0
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .dateAndTime
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func addDocument(_ sender: Any) {
        if newDocument.text?.isEmpty != true {
            let document = newDocument.text ?? ""
            let date = datePicker.date
            var items = UserDefaults.standard.array(forKey: "SubmitDocuments") ?? [[]]
            items.append([document, date])
            UserDefaults.standard.setValue(items, forKey: "SubmitDocuments")
        } else {
            return
        }
        newDocument.text = ""
        dismiss(animated: true, completion: nil)
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
