//
//  DTOMapper.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

struct DTOMapper {
    
    static func mapToDashboardModel(from dto: DrugDTO) -> DashboardDrug {
        return DashboardDrug(
            id: dto.rxcui,
            name: dto.name,
            synonym: dto.synonym
        )
    }
    
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
