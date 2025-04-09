//
//  RealmServiceImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import RealmSwift

class RealmServiceImpl: RealmService {
    private let realm: Realm

    init(databaseManager: LocalDatabaseManager = .shared) {
        self.realm = databaseManager.getRealm()
    }

    func save<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
            }
            print("Saved: \(object)")
        } catch {
            print("Error saving object: \(error.localizedDescription)")
        }
    }

    func fetchAll<T: Object>(_ type: T.Type) -> [T] {
        let results = realm.objects(type)
        return Array(results)
    }
    
    func delete<T: Object>(_ object: T) {
            do {
                try realm.write {
                    realm.delete(object)
                }
                print("Deleted: \(object)")
            } catch {
                print("Error deleting object: \(error.localizedDescription)")
            }
        }
}
