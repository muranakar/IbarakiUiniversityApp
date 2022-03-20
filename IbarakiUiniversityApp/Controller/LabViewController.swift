//
//  LabViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

class LabViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    var todomodel = ToDoModel()
    var  toDoItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwill")
        tableView.reloadData()
    }
}

extension LabViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoItems = todomodel.readData()
        if toDoItems.isEmpty != true {
            return toDoItems.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDocell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        toDoItems = todomodel.readData()

        if toDoItems.isEmpty != true {
            toDocell.textLabel?.text = toDoItems[indexPath.row]
            toDocell.textLabel?.textColor = .black
            toDocell.textLabel?.backgroundColor = .white
            return toDocell
        } else {
            toDocell.textLabel?.text = "現在タスクがありません"
            toDocell.textLabel?.textColor = .white
            toDocell.textLabel?.backgroundColor = .darkGray
            return toDocell
        }
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
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoItems = todomodel.readData()

            if toDoItems.isEmpty != true {
                toDoItems.remove(at: indexPath.row)
                todomodel.setData(data: toDoItems)
                tableView.reloadData()
            } else {
                return
            }
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
