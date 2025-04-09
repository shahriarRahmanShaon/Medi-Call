//
//  DrugDetailViewModel.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

class DrugDetailViewModel: ObservableObject {
    @Published var drug: DrugDetail
    private let repository: MedicallRepository
    private var cancellables = Set<AnyCancellable>()

    init(drug: DrugDetail, repository: MedicallRepository = MedicallRepositoryImpl()) {
        self.drug = drug
        self.repository = repository
    }

    func addToLocalDatabase() {
        let entity = MedicineEntity(
            id: drug.id,
            name: drug.name,
            synonym: drug.synonym,
            tty: drug.tty,
            language: drug.language,
            suppress: drug.suppress,
            umlscui: drug.umlscui
        )
        Just(entity)
            .sink { [weak self] entity in
                self?.repository.saveDrug(entity)
            }
            .store(in: &cancellables)
    }
}
