//
//  DrugDetail.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

struct DrugDetail: Identifiable, Hashable {
    let id: String
    let name: String
    let synonym: String?
    let tty: String?
    let language: String?
    let suppress: String?
    let umlscui: String?
}

