//
//  HttpClient.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

protocol HTTPClient {
    func getRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Swift.Result<T, RequestError>
}
