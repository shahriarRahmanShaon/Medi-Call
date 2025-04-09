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

    func fetchDrugs(keyword: String) -> AnyPublisher<[DrugDTO], Error> {
        guard var components = URLComponents(string: baseURL) else {
            return Fail(error: APIError.badRequest).eraseToAnyPublisher()
        }

        components.queryItems = [
            URLQueryItem(name: "name", value: keyword)
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
                ?? []
            }
            .eraseToAnyPublisher()
    }
}
