//
//  MedicallRemoteService.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

protocol MedicallRemoteService {
    func fetchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error>
}
