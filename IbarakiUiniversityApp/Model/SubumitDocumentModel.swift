//
//  SubumitDocument.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/02.
//

import Foundation

protocol SubmitDocumentModelInput{
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () -> ())
    func deleteItem(at index: Int, completion: () -> ())
}

final class SubmitDocumentModel: SubmitDocumentModelInput{

    private let userDefaluts = UserDefaults.standard
    private let ITEM_KEY = "SubmitDocumentItems"
    
    func fetchItems() -> [String] {
        return userDefaluts.array(forKey: ITEM_KEY) as! [String]
    }
    
    func addItem(itemContent: String, completion: () -> ()) {
        var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        items.append(itemContent)
        userDefaluts.set(items, forKey: ITEM_KEY)
        completion()
    }
    
    func deleteItem(at index: Int, completion: () -> ()) {
        var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
        items.remove(at: index)
        userDefaluts.set(items, forKey: ITEM_KEY)
        completion()
    }
    
    
    
}
