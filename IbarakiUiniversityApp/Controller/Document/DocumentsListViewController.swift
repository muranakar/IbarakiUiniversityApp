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

    var documentItems: Results<SubmitDocumentList>!
    var list: List<Documentinfo>!
    var documentinfo = Documentinfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DocumentTableViewCell", bundle: nil), forCellReuseIdentifier: "documentCell")

        do {
            let realm = try Realm()
            documentItems = realm.objects(SubmitDocumentList.self)
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
        if documentItems.isEmpty {
            return 1
        } else {
            return documentItems.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard documentItems.count != 0
        else {
            let noneCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            noneCell.textLabel?.text = "予定されている提出物がありません"
            noneCell.textLabel?.textAlignment = .center
            noneCell.textLabel?.textColor = .white
            noneCell.textLabel?.backgroundColor = .darkGray
            return noneCell
        }

        guard let documentCell = tableView.dequeueReusableCell(
            withIdentifier: "documentCell",
            for: indexPath
        ) as? DocumentTableViewCell
        else {
            return UITableViewCell()
        }

        documentCell.documentNameLabel?.text = documentItems[indexPath.row].documentToDos[0].documentToDo
        documentCell.deadlineLabel.text = diffdate(indexRow: indexPath.row)

        return documentCell
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
                    documentItems = realm.objects(SubmitDocumentList.self)
                    try realm.write {
                        realm.delete(documentItems[indexPath.row])
                    }
                } catch {
                    print("Error")
                }
                tableView.reloadData()
            } else {
                return
            }
        }
    }

    func diffdate(indexRow: Int) -> String {
        let now = Date()
        let calender = Calendar(identifier: .gregorian)
        let submitdate = documentItems[indexRow].documentToDos[0].deadline
        let diff = calender.dateComponents([.day], from: now, to: submitdate)
        guard let diffday = diff.day else {
            return "提出期限が設定されていません"
        }
        if diffday > 0 {
            return "締め切りまで \(diffday) 日です"
        } else if diffday == 0 {
            return "今日が提出期限です"
        } else {
            return "提出期限が過ぎています"
        }
    }
}

extension DocumentsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
