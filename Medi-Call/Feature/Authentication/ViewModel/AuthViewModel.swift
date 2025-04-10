//
//  AuthViewModel.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import Foundation
import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    @Published var didCheckAuthState = false
    
    private let repository: AuthRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: AuthRepository = AuthRepositoryImpl()) {
        self.repository = repository
    }
    
    func checkAuthState() {
        guard let user = Auth.auth().currentUser else {
            isAuthenticated = false
            didCheckAuthState = true
            return
        }

        // Force token refresh to validate session with Firebase
        user.getIDTokenResult(forcingRefresh: true) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Invalid session — probably deleted
                    print("Token refresh failed: \(error.localizedDescription)")
                    self?.isAuthenticated = false
                } else {
                    self?.isAuthenticated = true
                }
                self?.didCheckAuthState = true
            }
        }
    }

    
    
    func register() {
        isLoading = true
        repository.signUp(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                    case .success:
                        self?.isAuthenticated = true
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                        self?.showAlert = true
                }
            }
        }
    }
    
    func login() {
        isLoading = true
        repository.signIn(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                    case .success:
                        self?.isAuthenticated = true
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                        self?.showAlert = true
                }
            }
        }
    }
    
}

