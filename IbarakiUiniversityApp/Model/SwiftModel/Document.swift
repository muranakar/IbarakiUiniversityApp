//
//  Document.swift
//  IbarakiUiniversityApp
//
//  Created by 村中令 on 2022/04/20.
//

import Foundation

struct DocumentInfo {
    var uuid: UUID? {
        UUID(uuidString: uuidString)
    }
    var uuidString = UUID().uuidString
    var documentToDo: String
    var deadLine: Date
}
