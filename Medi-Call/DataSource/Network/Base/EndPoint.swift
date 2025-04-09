//
//  EndPoint.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.medi-call.com"
    }

}
