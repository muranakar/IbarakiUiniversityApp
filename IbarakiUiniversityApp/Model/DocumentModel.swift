//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

class DocumentModel: Model {
    var key: String = "SubmitDocuments"

    func setData(data: [String]) {
        UserDefaults.standard.setValue(data, forKey: key)
    }

    func readData() -> [String] {
        let readDocument = UserDefaults.standard.array(forKey: key) as? [String] ?? [""]
        let test = UserDefaults.standard.array(forKey: key)!
        print(test)
        return readDocument
    }

}
