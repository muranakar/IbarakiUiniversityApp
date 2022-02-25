//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

class DocumentModel{

    let documentKEY = "SubmitDocuments"

    init() {
    }

    func setData(submitDocument: [String]) {
        UserDefaults.standard.setValue(submitDocument, forKey: documentKEY)
    }

    func readData() -> [String] {
        let readDocument = UserDefaults.standard.array(forKey: documentKEY) as? [String] ?? [""]

        return readDocument
    }
}
