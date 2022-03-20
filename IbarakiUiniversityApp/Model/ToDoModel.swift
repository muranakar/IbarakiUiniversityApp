//
//  ToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

protocol Model {
    var key: String {get set}
    func setData(data: [String])
    func readData() -> [String]
}

class ToDoModel: Model {
    var key: String = "LabToDo"

    func setData(data: [String]) {
        UserDefaults.standard.setValue(data, forKey: key)
    }

    func readData() -> [String] {
        let readToDo = UserDefaults.standard.array(forKey: key) as? [String] ?? [""]

        return readToDo
    }
}
