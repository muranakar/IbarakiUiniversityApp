//
//  LabViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit
import RealmSwift

class LabViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var toDoItems: Results<ToDoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LabToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "todoCell")

        do {
            let realm = try Realm()
            toDoItems = realm.objects(ToDoModel.self)
        } catch {
            print("Error")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension LabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if toDoItems == nil {
            return 1
        } else {
            return toDoItems.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoCell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        if toDoItems == nil {
            toDoCell.textLabel?.text = "現在タスクがありません"
            toDoCell.textLabel?.textColor = .white
            toDoCell.textLabel?.backgroundColor = .darkGray
            return toDoCell
        }
        let toDoObject = toDoItems[indexPath.row]
        toDoCell.textLabel?.text = toDoObject.labTODO
        toDoCell.textLabel?.textColor = .black
        toDoCell.textLabel?.backgroundColor = .white
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
            if toDoItems != nil {
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
