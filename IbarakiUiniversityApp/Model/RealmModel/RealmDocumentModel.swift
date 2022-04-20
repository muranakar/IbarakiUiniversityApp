//
//  RealmDocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by 村中令 on 2022/04/20.
//

import Foundation
import RealmSwift

class RealmSubmitDocumentList: Object {
    let documentToDos = List<Documentinfo>()
}

class RealmDocumentinfo: Object {
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

