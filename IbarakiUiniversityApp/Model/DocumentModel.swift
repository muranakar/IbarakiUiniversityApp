//
//  DocumentModel.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/09.
//

import Foundation
import RealmSwift

class DocumentModel: Object {

    var key: String = "SubmitDocuments"

    @objc dynamic var documentTODO: [[String]]? = nil

}
