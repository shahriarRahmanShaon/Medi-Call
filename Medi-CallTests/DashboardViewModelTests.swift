//
//  DashboardViewModelTests.swift
//  Medi-CallTests
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import XCTest
import Combine
@testable import Medi_Call

final class DashboardViewModelTests: XCTestCase {

    var viewModel: DashboardViewModel!
    fileprivate var mockRepo: MockMedicallRepository!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockRepo = MockMedicallRepository()
        viewModel = DashboardViewModel(repository: mockRepo)
        cancellables = []
    }

    func testFetchSavedMeds() {
        let med1 = MedicineEntity(id: "1010", name: "Cymbalta")

        mockRepo.savedDrugs = [med1]
        viewModel.fetchSavedMeds()

        XCTAssertEqual(viewModel.savedMeds, [med1])
    }
}

fileprivate class MockMedicallRepository: MedicallRepository {
    var savedDrugs: [MedicineEntity] = []
    var searchResult: [DrugDTO] = []

    func searchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error> {
        return Just(searchResult)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func saveDrug(_ entity: MedicineEntity) {
        savedDrugs.append(entity)
    }

    func getSavedDrugs() -> [MedicineEntity] {
        return savedDrugs
    }

    func deleteDrug(_ entity: MedicineEntity) {
        savedDrugs.removeAll { $0 == entity }
    }
}

