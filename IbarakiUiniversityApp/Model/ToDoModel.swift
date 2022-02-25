//
//  ToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

class ToDoModel{

    let todoKEY = "LabToDo"

    init() {
    }

    func setData(toDo:[String]) {
        UserDefaults.standard.setValue(toDo, forKey: todoKEY)
    }

    func readData() -> [String] {
        let readToDo = UserDefaults.standard.array(forKey: todoKEY) as? [String] ?? [""]

        return readToDo
    }
}
