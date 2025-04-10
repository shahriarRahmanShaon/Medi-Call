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

    /// Adds the current drug to the local database.
    ///
    /// - Returns: Saves a `MedicineEntity` converted from the current `DrugDetail` to persistent storage and shows an alert upon completion.
    /// - Discussion:
    /// Converts the `drug` into a `MedicineEntity` and stores it using the repository. This method also triggers
    /// UI feedback by toggling `isLoading`, `showAlert`, and `alertMessage`.
    ///
    /// ```swift
    /// viewModel.addToLocalDatabase()
    /// if viewModel.showAlert {
    ///     print(viewModel.alertMessage) // "Data saved successfully"
    /// }
    /// ```
    
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

