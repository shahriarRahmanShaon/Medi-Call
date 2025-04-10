//
//  MedicallRemoteServiceImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

import Combine

struct MedicallRemoteServiceImpl: MedicallRemoteService {
    private let fetcher: DataFetcher
    private let baseURL = "https://rxnav.nlm.nih.gov/REST/drugs.json"

    init(fetcher: DataFetcher = APIClient()) {
        self.fetcher = fetcher
    }

    /// Fetches a list of drugs matching a keyword from the RxNav API.
    ///
    /// - Parameter keyword: The drug name to search for.
    /// - Returns: A publisher emitting an array of `DrugDTO` or an `Error`.
    ///
    /// - Note: Limits results to 10 items and expands the `psn` field in the query.
    /// 
    func fetchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error> {
        guard var components = URLComponents(string: baseURL) else {
            return Fail(error: APIError.badRequest).eraseToAnyPublisher()
        }

        components.queryItems = [
            URLQueryItem(name: "name", value: keyword),
            URLQueryItem(name: "expand", value: "psn")
        ]

        guard let url = components.url else {
            return Fail(error: APIError.badRequest).eraseToAnyPublisher()
        }

        return fetcher.request(url: url)
            .decode(type: DrugResponseDTO.self, decoder: JSONDecoder())
            .tryMap { dto in
                dto.drugGroup.conceptGroup?
                    .compactMap { $0.conceptProperties }
                    .flatMap { $0 }
                    .prefix(10)
                    .map { $0 }
                ?? []
            }
            .eraseToAnyPublisher()
    }

}
