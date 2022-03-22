//
//  LabViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import RealmSwift

struct LabToDoCount {

    enum LabToDoType {
        case non
        case on
    }

    func countResult (type: LabToDoType, cell: UITableViewCell) {
        switch type {
        case .non:
            cell.textLabel?.textColor = .black
            cell.textLabel?.backgroundColor = .white
        case .on:
            cell.textLabel?.text = "現在タスクがありません"
            cell.textLabel?.textColor = .white
            cell.textLabel?.backgroundColor = .darkGray
        }
    }
}

class LabViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

//    var todomodel = ToDoModel()
//    var  toDoItems = [String]()
    var toDoItems: Results<ToDoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
//        tableView.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension LabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let toDoObject = toDoItems[indexPath.row]
        if toDoItems.count == 0 {
            toDoCell.textLabel?.text = "現在タスクがありません"
            toDoCell.textLabel?.textColor = .white
            toDoCell.textLabel?.backgroundColor = .darkGray
        } else {
            toDoCell.textLabel?.text = toDoObject.labTODO
            toDoCell.textLabel?.textColor = .black
            toDoCell.textLabel?.backgroundColor = .white
        }
        return toDoCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if toDoItems.count == 0 {
                deleteLabToDo(at: indexPath.row)
                tableView.reloadData()
            } else {
                return
            }
        }
    }
    func deleteLabToDo (at index: Int) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(toDoItems[index])
            }
        } catch {
            print("Error")
        }
    }
}
extension LabViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
}
