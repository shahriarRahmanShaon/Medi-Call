//
//  RealmService.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import RealmSwift

protocol RealmService {
    func save<T: Object>(_ object: T)
    func fetchAll<T: Object>(_ type: T.Type) -> [T]
    func delete<T: Object>(_ object: T)
}

