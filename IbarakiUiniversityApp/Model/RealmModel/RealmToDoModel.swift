//
//  RealmToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by 村中令 on 2022/04/20.
//

import Foundation
import RealmSwift

class RealmToDoModel: Object {
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
