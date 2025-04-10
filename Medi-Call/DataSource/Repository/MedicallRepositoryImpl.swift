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
    private let realmService: RealmService

    init(
        remoteService: MedicallRemoteService = MedicallRemoteServiceImpl(),
        realmService: RealmService = RealmServiceImpl()
    ) {
        self.remoteService = remoteService
        self.realmService = realmService
    }

    func searchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error> {
        remoteService.fetchDrugs(keyword: keyword)
            .eraseToAnyPublisher()
    }

    func saveDrug(_ entity: MedicineEntity) {
        realmService.save(entity)
    }

    func getSavedDrugs() -> [MedicineEntity] {
        return realmService.fetchAll(MedicineEntity.self)
    }

    func deleteDrug(_ entity: MedicineEntity) {
        realmService.delete(entity)
    }
}


