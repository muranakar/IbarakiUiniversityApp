//
//  SubmitDocumentsPresenter.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/02.
//

import Foundation

protocol SubmitDocumentPresenterInput {
    var numberOfItems: Int{get}
    func item(forRow row: Int) -> String?
    func addNewItem(itemContent: String)
    func didEditingDelete(at indexPath: IndexPath)
    func viewDidLoad()
}

protocol SubmitDocumentPresenterOutput: AnyObject{
    func updateItems()
}

final class SubmitDocumentPresenter: SubmitDocumentPresenterInput {


    private(set) var items: [String] = []

    private weak var view: SubmitDocumentPresenterOutput!
    private var model: SubmitDocumentModelInput
    
    init(view: SubmitDocumentPresenterOutput, model: SubmitDocumentModelInput) {
        self.view = view
        self.model = model
    }
    
    
    var numberOfItems: Int {
        return items.count
    }
    
    func item(forRow row: Int) -> String? {
        return items[row]
    }
    
    func addNewItem(itemContent: String) {
        model.addItem(itemContent: itemContent){
            items = model.fetchItems()
            view.updateItems()
        }
    }
    
    func didEditingDelete(at indexPath: IndexPath) {
        model.deleteItem(at: indexPath.row){
            items = model.fetchItems()
            view.updateItems()
        }
    }
    
    
    func viewDidLoad() {
        items = model.fetchItems()
        view.updateItems()
    }
    

}
