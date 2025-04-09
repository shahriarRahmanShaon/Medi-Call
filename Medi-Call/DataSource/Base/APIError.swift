//
//  APIError.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

enum APIError: LocalizedError {
    case badRequest
    case decodingError
    case invalidURLResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad request"
        case .decodingError:
            return "Check your response and model types"
        case .invalidURLResponse(url: let url):
            return "Invalid response from URL: \(url)"
        case .unknown:
            return "Unknown error occured"
        }
    }
}
