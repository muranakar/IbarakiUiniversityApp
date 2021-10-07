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
        
        UserDefaults.standard.setValue(["修理"], forKey: "LabToDo")
        
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
        
        return ToDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        ToDoItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        cell.textLabel?.text = ToDoItems[indexPath.row]
        
        return cell
    }
}

extension LabViewController: UITableViewDelegate{
    
}
