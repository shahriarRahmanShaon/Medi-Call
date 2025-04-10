//
//  Coordinator.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype RouteType

    var path: NavigationPath { get set }
    func push(_ route: RouteType)
    func pop()
    func popToRoot()
}
