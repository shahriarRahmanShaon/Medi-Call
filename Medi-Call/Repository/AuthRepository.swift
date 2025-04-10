//
//  AuthRepository.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation

protocol AuthRepository {
    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}

