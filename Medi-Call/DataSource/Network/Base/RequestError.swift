//
//  RequestError.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

enum RequestError: Error, Equatable {
    case encode
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case networkNotAvailable
    case invalidApiResponse
    case unknown(message: String)
    
    var customMessage: String {
        switch self {
        case .encode:
            return "Encode error"
        case .decode:
            return "Decode error"
        case .invalidURL:
            return "Invalid URL"
        case .unauthorized:
            return "Session expired"
        case .networkNotAvailable:
            return "Could not connect to the Internet"
        case .invalidApiResponse:
            return "Invalid API Response!"
        case .unknown(let message):
            return message
        default:
            return "Unknown error"
        }
    }
}
