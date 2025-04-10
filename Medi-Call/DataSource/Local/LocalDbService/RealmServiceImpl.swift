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

    /// Saves an object to the Realm database.
    ///
    /// - Parameter object: The object to be saved. Must conform to `RealmSwift.Object`.
    ///
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

    /// Fetches all objects of a specified type from the Realm database.
    ///
    /// - Parameter type: The object type to fetch.
    /// - Returns: An array of all objects of the given type.
    ///
    func fetchAll<T: Object>(_ type: T.Type) -> [T] {
        let results = realm.objects(type)
        return Array(results)
    }
    
    /// Deletes an object from the Realm database.
    ///
    /// - Parameter object: The object to delete.
    ///
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
