//
//  AuthAPIServiceImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation
import FirebaseAuth

class AuthAPIServiceImpl: AuthAPIService {
    /// Registers a new user with Firebase Authentication.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - completion: A closure returning a `Result` with `UserModel` on success or an `Error` on failure.
    ///
    func register(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        FirebaseAuthManager.shared.createUser(email: email, password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(UserModel(uid: user.uid, email: user.email ?? "")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// Logs in an existing user using Firebase Authentication.
    ///
    /// - Parameters:
    ///   - email: The user's email address.
    ///   - password: The user's password.
    ///   - completion: A closure returning a `Result` with `UserModel` on success or an `Error` on failure.
    ///
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        FirebaseAuthManager.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                completion(.success(UserModel(uid: user.uid, email: user.email ?? "")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

