//
//  AuthAPIServiceImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation
import FirebaseAuth

class AuthAPIServiceImpl: AuthAPIService {
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

