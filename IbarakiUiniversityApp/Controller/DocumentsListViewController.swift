//
//  DocumentsListViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import RealmSwift

class DocumentsListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var documentItems: Results<DocumentList>!
    var list: List<DocumentInfo>!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(documentItems)
        print(list)
        tableView.delegate = self
//        tableView.dataSource = self

        do {
            let realm = try Realm()
            documentItems = realm.objects(DocumentList.self)
        } catch {
            print("Error")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension DocumentsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if documentItems == nil {
            return 1
        } else {
            return documentItems.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let documentCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if documentItems == nil {
            documentCell.textLabel?.text = "予定されている提出物がありません"
            documentCell.textLabel?.textColor = .white
            documentCell.textLabel?.backgroundColor = .darkGray
            return documentCell
        } else {
//            documentCell.textLabel?.text = documentItems[indexPath.row]
            documentCell.textLabel?.textColor = .black
            documentCell.textLabel?.backgroundColor = .white
            return documentCell
        }

//        documentItems = documentmodel.readData()
//        if documentItems.isEmpty != true {
//            documentcell.textLabel!.text = documentItems[indexPath.row]
//            documentcell.textLabel?.textColor = .black
//            documentcell.textLabel?.backgroundColor = .white
//            return documentcell
//        } else {
//            documentcell.textLabel?.text = "予定されている提出物がありません"
//            documentcell.textLabel?.textColor = .white
//            documentcell.textLabel?.backgroundColor = .darkGray
//            return documentcell
//        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

//    func tableView(_ tableView: UITableView,
//                   commit editingStyle: UITableViewCell.EditingStyle,
//                   forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            documentItems = documentmodel.readData()
//            if documentItems.isEmpty != true {
//                documentItems.remove(at: indexPath.row)
//                documentmodel.setData(data: documentItems)
//                tableView.reloadData()
//            } else {
//                return
//            }
//        }
//    }
}

extension DocumentsListViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
}
