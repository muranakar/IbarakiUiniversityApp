//
//  DocumentsListViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

class DocumentsListViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var DocumentItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension DocumentsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        DocumentItems = UserDefaults.standard.stringArray(forKey: "LabToDo")!
        
        return DocumentItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        DocumentItems = UserDefaults.standard.stringArray(forKey: "LabToDo")!
        
        cell.textLabel!.text = DocumentItems[indexPath.row]
        return cell
    }
}

extension DocumentsListViewController: UITableViewDelegate{
    
}
