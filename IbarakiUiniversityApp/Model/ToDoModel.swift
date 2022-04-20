//
//  ToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation
import RealmSwift

class ToDoModel: Object {
    @objc dynamic var uuidString = ""
    @objc dynamic var labTODO: String?
    var uuid: UUID? {
            UUID(uuidString: uuidString)
        }
    override class func primaryKey() -> String? {
        "uuidString"
    }

    convenience init(labToDo: String) {
        self.init()
        self.labTODO = labToDo
    }
}
