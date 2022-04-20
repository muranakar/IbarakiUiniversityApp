//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation
import RealmSwift

class SubmitDocumentList: Object {
    let documentToDos = List<Documentinfo>()
}

class Documentinfo: Object {
    @objc dynamic var uuidString = ""
    @objc dynamic var documentToDo: String = ""
    @objc dynamic var deadline: Date = Date()

    var uuid: UUID? {
        UUID(uuidString: uuidString)
    }
    override class func primaryKey() -> String? {
        "uuidString"
    }
    convenience init(toDo: String, deadline: Date) {
        self.init()
        self.documentToDo = toDo
        self.deadline = deadline
    }
    let submitDocumentLists = LinkingObjects(fromType: SubmitDocumentList.self, property: "documentToDos")
}
