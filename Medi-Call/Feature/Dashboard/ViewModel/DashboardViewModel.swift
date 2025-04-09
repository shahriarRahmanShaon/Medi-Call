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

    func fetchSavedMeds() {
        savedMeds = repository.getSavedDrugs()
    }

    func deleteDrug(_ entity: MedicineEntity) {
        repository.deleteDrug(entity)
        fetchSavedMeds()
    }

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




