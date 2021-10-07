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
        UserDefaults.standard.setValue(["証明書"], forKey: "Documents")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwill")
        tableView.reloadData()
    }
    
    //ここの実装いる？
    func configreRefreshControl (){
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
    
    
    @IBAction func AddDocumentButton(_ sender: Any) {
        let addDocumentViewController = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as! AddDocumentViewController
        self.present(addDocumentViewController, animated: true, completion: nil)
        
    }
    
}

extension DocumentsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        DocumentItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        return DocumentItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        DocumentItems = UserDefaults.standard.array(forKey: "LabToDo") as! [String]
        
        cell.textLabel!.text = DocumentItems[indexPath.row]
        return cell
    }
    

}

extension DocumentsListViewController: UITableViewDelegate{

}
