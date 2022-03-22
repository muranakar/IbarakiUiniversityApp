//
//  ToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation
import RealmSwift

class ToDoModel: Object {

    var key: String = "LabToDo"

    @objc dynamic var labTODO: String? = nil

}
