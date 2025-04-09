//
//  MedicallRepository.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

protocol MedicallRepository {
    func searchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error>
}

