//
//  DrugDTO.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

struct DrugResponseDTO: Codable {
    let drugGroup: DrugGroupDTO
}

struct DrugGroupDTO: Codable {
    let name: String?
    let conceptGroup: [ConceptGroupDTO]?
}

struct ConceptGroupDTO: Codable {
    let tty: String?
    let conceptProperties: [DrugDTO]?
}

struct DrugDTO: Codable, Identifiable {
    let rxcui: String
    let name: String
    let synonym: String?
    let tty: String?
    let language: String?
    let suppress: String?
    let umlscui: String?

    var id: String { rxcui }
}

