//
//  Route.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation

enum Route: Hashable {
    case dashboard
    case drugSearch
    case drugDetail(DrugDetail)
}
