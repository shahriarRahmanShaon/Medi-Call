//
//  MedicineEntiry.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import RealmSwift

class MedicineEntity: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var synonym: String? = nil
    @objc dynamic var tty: String? = nil
    @objc dynamic var language: String? = nil
    @objc dynamic var suppress: String? = nil
    @objc dynamic var umlscui: String? = nil

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(
        id: String,
        name: String,
        synonym: String? = nil,
        tty: String? = nil,
        language: String? = nil,
        suppress: String? = nil,
        umlscui: String? = nil
    ) {
        self.init()
        self.id = id
        self.name = name
        self.synonym = synonym
        self.tty = tty
        self.language = language
        self.suppress = suppress
        self.umlscui = umlscui
    }
}

