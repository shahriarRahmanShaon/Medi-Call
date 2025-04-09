//
//  APIService.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation
import Combine

protocol DataFetcher {
    func request(url: URL) -> AnyPublisher<Data, Error>
}

struct APIClient: DataFetcher {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func request(url: URL) -> AnyPublisher<Data, Error> {
        session.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      200..<300 ~= response.statusCode else {
                    throw APIError.invalidURLResponse(url: url)
                }
                return result.data
            }
            .receive(on: DispatchQueue.main)
            .retry(2)
            .mapError { error -> Error in
                if let decodingError = error as? DecodingError {
                    return APIError.decodingError
                }
                return error
            }
            .eraseToAnyPublisher()
    }
}


