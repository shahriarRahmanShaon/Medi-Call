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

    /// Sends a data request to the specified URL.
    ///
    /// - Parameter url: The `URL` to send the request to.
    /// - Returns: A publisher that emits `Data` on success or an `Error` on failure.
    /// - Discussion:
    /// Handles background processing, retries, and response validation. Throws an error for non-2xx HTTP responses.
    ///
    /// ```swift
    /// apiClient.request(url: someURL)
    ///     .sink(receiveCompletion: { ... }, receiveValue: { data in
    ///         // Use data
    ///     })
    ///     .store(in: &cancellables)
    /// ```
    ///
    func request(url: URL) -> AnyPublisher<Data, Error> {
        print("[Medi-Call Client] Making request to URL: \(url.absoluteString)")

        return session.dataTaskPublisher(for: url)
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
                if let _ = error as? DecodingError {
                    return APIError.decodingError
                }
                return error
            }
            .eraseToAnyPublisher()
    }

}


