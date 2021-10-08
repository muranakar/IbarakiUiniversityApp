//
//  ToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation

class ToDoModel{
    
    let TODO_KEY = "LabToDo"
    
    init(){
        
    }
    
    func setData(ToDo:[String]){
        UserDefaults.standard.setValue(ToDo, forKey: TODO_KEY)
    }
    
    func readData() -> [String]{
        
        let readToDo = UserDefaults.standard.array(forKey: TODO_KEY) as! [String]
        
        return readToDo
    }
    
    
}
