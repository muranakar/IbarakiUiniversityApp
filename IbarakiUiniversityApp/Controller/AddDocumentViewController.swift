//
//  AddDocumentViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit
import Combine

class AddDocumentViewController: UIViewController {
    @IBOutlet private weak var newDocument: UITextField!
    @IBOutlet private weak var addButon: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!

    struct SubmitDocument {
        var documentName: String?
        var submitDate: Date?

        init (documentName: String, submitDate: Date) {
            guard documentName != "" else {
                return
            }
            self.documentName = documentName
            self.submitDate = submitDate
        }
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
