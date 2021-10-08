//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

class DocumentModel{
    
    let DOCUMENT_KEY = "SubmitDocuments"
    
    init(){
        
    }
    
    func setData(SubmitDocument:[String]){
        UserDefaults.standard.setValue(SubmitDocument, forKey: DOCUMENT_KEY)
    }
    
    func readData() -> [String]{
        
        let readDocument = UserDefaults.standard.array(forKey: DOCUMENT_KEY) as! [String]
        
        return readDocument
    }
    
}
