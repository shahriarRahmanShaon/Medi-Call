//
//  LocalDatabaseManager.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import RealmSwift

class LocalDatabaseManager {
    static let shared = LocalDatabaseManager()

    private let realm: Realm

    private init() {
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
    }

    func getRealm() -> Realm {
        return realm
    }
}
