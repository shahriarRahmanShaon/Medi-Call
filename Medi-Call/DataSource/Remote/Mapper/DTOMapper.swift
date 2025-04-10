//
//  DTOMapper.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

struct DTOMapper {
    
    /// Maps a `DrugDTO` to a `DashboardDrug` model.
    ///
    /// - Parameter dto: The `DrugDTO` to map.
    /// - Returns: A `DashboardDrug` instance.
    ///
    static func mapToDashboardModel(from dto: DrugDTO) -> DashboardDrug {
        return DashboardDrug(
            id: dto.rxcui,
            name: dto.name,
            synonym: dto.synonym
        )
    }
    
    /// Maps a `DrugDTO` to a detailed `DrugDetail` model.
    ///
    /// - Parameter dto: The `DrugDTO` to map.
    /// - Returns: A `DrugDetail` instance.
    ///
    static func mapToDetailModel(from dto: DrugDTO) -> DrugDetail {
        return DrugDetail(
            id: dto.rxcui,
            name: dto.name,
            synonym: dto.synonym,
            tty: dto.tty,
            language: dto.language,
            suppress: dto.suppress,
            umlscui: dto.umlscui
        )
    }
}
