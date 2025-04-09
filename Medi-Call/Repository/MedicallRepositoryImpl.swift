//
//  MedicallRepositoryImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

struct MedicallRepositoryImpl: MedicallRepository {
    private let remoteService: MedicallRemoteService

    init(remoteService: MedicallRemoteService = MedicallRemoteServiceImpl()) {
        self.remoteService = remoteService
    }

    func searchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error> {
        remoteService.fetchDrugs(keyword: keyword)
            .eraseToAnyPublisher()
    }
}

