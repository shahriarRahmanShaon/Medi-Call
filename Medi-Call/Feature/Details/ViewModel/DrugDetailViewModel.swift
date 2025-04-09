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
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var alertMessage = ""

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
        
        self.isLoading = true
        Just(entity)
            .sink { [weak self] entity in
                self?.repository.saveDrug(entity)
                self?.isLoading = false
                self?.showAlert = true
                self?.alertMessage = "Data saved successfully"
            }
            .store(in: &cancellables)
    }
}

