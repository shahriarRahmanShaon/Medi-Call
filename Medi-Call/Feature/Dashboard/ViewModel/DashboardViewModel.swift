//
//  DashboardViewModel.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var savedMeds: [MedicineEntity] = []
    @Published var keyword: String = ""
    @Published var results: [DrugDTO] = []
    @Published var isLoading: Bool = false
    @Published var isFieldFocused: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private let repository: MedicallRepository
    
    init(repository: MedicallRepository = MedicallRepositoryImpl()) {
        self.repository = repository
        fetchSavedMeds()
    }
    
    /// Fetches the list of saved medicines from the local repository.
    ///
    /// - Returns: Updates the `savedMeds` array with locally stored `MedicineEntity` objects.
    /// - Discussion:
    /// This method should be called when the dashboard loads to present the user's saved medicines.
    ///
    /// ```swift
    /// viewModel.fetchSavedMeds()
    /// ```
    
    func fetchSavedMeds() {
        savedMeds = repository.getSavedDrugs()
    }
    
    /// Deletes a specific medicine from the local database.
    ///
    /// - Parameter entity: The `MedicineEntity` to be deleted.
    /// - Returns: Refreshes the `savedMeds` list after deletion.
    /// - Discussion:
    /// After deletion, this method calls `fetchSavedMeds()` to keep the UI in sync with the data source.
    ///
    /// ```swift
    /// let med = viewModel.savedMeds.first
    /// if let med = med {
    ///     viewModel.deleteDrug(med)
    /// }
    /// ```
    ///
    
    func deleteDrug(_ entity: MedicineEntity) {
        repository.deleteDrug(entity)
        fetchSavedMeds()
    }
    
    
    /// Performs a search for drugs using the current keyword.
    ///
    /// - Returns: Updates the `results` array with a list of matching `DrugDTO` objects.
    /// - Discussion:
    /// Triggers the repository’s `searchDrugs(keyword:)` method and handles asynchronous loading state.
    /// Ideal for binding to a search field in the UI.
    ///
    /// ```swift
    /// viewModel.keyword = "paracetamol"
    /// viewModel.searchDrugs()
    /// ```
    ///
    
    func searchDrugs() {
        isLoading = true
        repository.searchDrugs(keyword: keyword)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
            }, receiveValue: { [weak self] drugs in
                self?.results = drugs
            })
            .store(in: &cancellables)
    }
}




