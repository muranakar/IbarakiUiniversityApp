//
//  AddDocumentViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/05.
//

import UIKit
import RealmSwift

class AddDocumentViewController: UIViewController {
    @IBOutlet private weak var newDocument: UITextField!
    @IBOutlet private weak var addButon: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!

    let documentInfo = DocumentInfo()
    var list: List<DocumentInfo>!

    var picker: UIDatePicker = UIDatePicker()

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

        do {
            let realm = try Realm()
            list = realm.objects(DocumentList.self).first?.documentToDos
        } catch {
            print("Error")
        }
    }

    func uiSetting () {
        addButon.layer.cornerRadius = 5.0
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction private func addDocument(_ sender: Any) {
        do {
            let realm = try Realm()
            let documentInfo = DocumentInfo()
            let formatter = DateFormatter()

            documentInfo.documentToDo = newDocument?.text ?? ""
            formatter.dateFormat = "MM/dd"
            documentInfo.documentDeadline = formatter.string(from: picker.date)

            try realm.write {
                if list == nil {
                    let documentList = DocumentList()
                    documentList.documentToDos.append(documentInfo)
                    realm.add(documentList)
                }
                realm.add(documentInfo)
            }
            dismiss(animated: true)
        } catch {
            print("Error realm")
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
