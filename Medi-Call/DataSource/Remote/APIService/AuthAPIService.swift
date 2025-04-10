//
//  AuthAPIService.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation

protocol AuthAPIService {
    func register(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}

