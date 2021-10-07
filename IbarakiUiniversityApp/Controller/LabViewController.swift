//
//  LabViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

class LabViewController: UIViewController {
    
    var  ToDoItems = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
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

extension LabViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        ToDoItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        if ToDoItems.isEmpty != true {
            return ToDoItems.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ToDocell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        ToDoItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        if ToDoItems.isEmpty != true{
            ToDocell.textLabel?.text = ToDoItems[indexPath.row]
            ToDocell.textLabel?.textColor = .black
            ToDocell.textLabel?.backgroundColor = .white
            return ToDocell
        }else {
            ToDocell.textLabel?.text = "現在タスクがありません"
            ToDocell.textLabel?.textColor = .white
            ToDocell.textLabel?.backgroundColor = .darkGray
            return ToDocell
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            ToDoItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
            if ToDoItems.isEmpty != true{
                ToDoItems.remove(at: indexPath.row)
                UserDefaults.standard.setValue(ToDoItems, forKey: "LabToDo")
                tableView.reloadData()
            }else{
                return
            }
        }
    }
}

extension LabViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    
    }
    
}
