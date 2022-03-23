//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation
import RealmSwift

class DocumentInfo: Object {
    @objc dynamic var documentToDo: String = ""
    @objc dynamic var documentDeadline: String = ""
}

class DocumentModel: Object {
    let documentToDos = List<DocumentInfo>()
}
