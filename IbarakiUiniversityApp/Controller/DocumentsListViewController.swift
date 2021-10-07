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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewwill")
        tableView.reloadData()
    }
}

extension DocumentsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        DocumentItems = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
        if DocumentItems.isEmpty != true {
            return DocumentItems.count
        }else {
            return 1
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Documentcell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        DocumentItems = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
        
        if DocumentItems.isEmpty != true{
            Documentcell.textLabel!.text = DocumentItems[indexPath.row]
            Documentcell.textLabel?.textColor = .black
            Documentcell.textLabel?.backgroundColor = .white
            
            return Documentcell
        }else {
            Documentcell.textLabel?.text = "予定されている提出物がありません"
            Documentcell.textLabel?.textColor = .white
            Documentcell.textLabel?.backgroundColor = .darkGray
            
            
            return Documentcell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            DocumentItems = UserDefaults.standard.array(forKey: "SubmitDocuments") as! [String]
            if DocumentItems.isEmpty != true{
                DocumentItems.remove(at: indexPath.row)
                UserDefaults.standard.setValue(DocumentItems, forKey: "SubmitDocuments")
                tableView.reloadData()
            }else{
                return
            }

        }
    }

}

extension DocumentsListViewController: UITableViewDelegate{
    
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
