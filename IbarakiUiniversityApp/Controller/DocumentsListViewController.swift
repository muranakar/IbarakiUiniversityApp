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
    var documentinfo = DocumentInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DocumentTableViewCell", bundle: nil), forCellReuseIdentifier: "documentCell")

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
        if documentItems == nil {
            let noneCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            noneCell.textLabel?.text = "予定されている提出物がありません"
            noneCell.textLabel?.textColor = .white
            noneCell.textLabel?.backgroundColor = .darkGray
            return noneCell
        } else {
            guard let documentCell = tableView.dequeueReusableCell(
                withIdentifier: "documentCell",
                for: indexPath
            ) as? DocumentTableViewCell else { return UITableViewCell() }

            documentCell.documentNameLabel?.text = documentItems[indexPath.row].documentToDos[0].documentToDo
            documentCell.deadlineLabel.text = documentItems[indexPath.row].documentToDos[0].documentDeadline
//            documentCell.textLabel?.textColor = .black
//            documentCell.textLabel?.backgroundColor = .white
            return documentCell
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if documentItems.isEmpty != true {
                do {
                    let realm = try Realm()
                    documentItems = realm.objects(DocumentList.self)
                    print("リストから要素を削除")
                } catch {
                    print("Error")
                }
                tableView.reloadData()
            } else {
                return
            }
        }
    }
}

extension DocumentsListViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
}
