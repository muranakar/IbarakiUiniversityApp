//
//  RealmToDoModel.swift
//  IbarakiUiniversityApp
//
//  Created by 村中令 on 2022/04/20.
//

import Foundation
import RealmSwift

class RealmToDo: Object {
    // UUIDを用いて、プライマリキーを設定してます。
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

private extension ToDo {
    //　ここで共通型に変換
    init(managedObject: RealmToDo) {
        self.uuidString = managedObject.uuidString
        self.labToDo = managedObject.labTODO
    }
    // ここでRealmオブジェクトに変換
    func managedObject() -> RealmToDo {
        let realmToDo = RealmToDo()
        realmToDo.uuidString = self.uuidString
        realmToDo.labTODO = self.labToDo
        return realmToDo
    }
}

final class IbarakiUiniversityRepository {
    // swiftlint:disable:next force_cast
    private let realm = try! Realm()

    // すべてのToDoリストをロードしてます。
    func loadToDo() -> [ToDo] {
        let realmToDos = realm.objects(RealmToDo.self)
        let realmToDosArray = Array(realmToDos)
        let toDos = realmToDosArray.map {ToDo(managedObject: $0) }
        return toDos
    }

    // append
    // update
    // remove
    //　を同じように書いていく。
}


