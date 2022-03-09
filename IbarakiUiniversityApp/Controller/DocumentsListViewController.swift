//
//  DocumentsListViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

class DocumentsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var documentmodel = DocumentModel()
    var documentItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwill")
        tableView.reloadData()
    }
}

extension DocumentsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        documentItems = documentmodel.readData()
        if documentItems.isEmpty != true {
            return documentItems.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let documentcell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        documentItems = documentmodel.readData()
        if documentItems.isEmpty != true {
            documentcell.textLabel!.text = documentItems[indexPath.row]
            documentcell.textLabel?.textColor = .black
            documentcell.textLabel?.backgroundColor = .white
            return documentcell
        } else {
            documentcell.textLabel?.text = "予定されている提出物がありません"
            documentcell.textLabel?.textColor = .white
            documentcell.textLabel?.backgroundColor = .darkGray
            return documentcell
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            documentItems = documentmodel.readData()
            if documentItems.isEmpty != true {
                documentItems.remove(at: indexPath.row)
                documentmodel.setData(submitDocument: documentItems)
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
        return 80
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
}
