//
//  DocumentsListViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/01.
//

import UIKit

class DocumentsListViewController: UIViewController {
    
    private var presenter: SubmitDocumentPresenterInput!
    func inject (presenter: SubmitDocumentPresenterInput){
        self.presenter = presenter
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var newItemTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter.viewDidLoad()
        
    }
    
    @IBAction func AddButton(_ sender: Any) {
        
        if !newItemTextField.text!.isEmpty{
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
            newItemTextField.resignFirstResponder()
        }
    }
    
}

extension DocumentsListViewController: SubmitDocumentPresenterOutput{
    func updateItems(){
        tableView.reloadData()
    }
}

extension DocumentsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)
        
        return cell
    }
    
}

extension DocumentsListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            presenter.didEditingDelete(at: indexPath)
        }
    }
}

extension DocumentsListViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
