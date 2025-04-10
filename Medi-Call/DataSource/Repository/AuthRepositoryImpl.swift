//
//  AuthRepositoryImpl.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

class AuthRepositoryImpl: AuthRepository {
    private let service: AuthAPIService

    init(service: AuthAPIService = AuthAPIServiceImpl()) {
        self.service = service
    }

    func signUp(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        service.register(email: email, password: password, completion: completion)
    }

    func signIn(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        service.login(email: email, password: password, completion: completion)
    }
}

