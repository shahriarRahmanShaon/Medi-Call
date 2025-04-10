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
    
    /// Checks the current user's authentication state by verifying the Firebase ID token.
    ///
    /// 
    /// - Discussion:
    /// This method ensures authentication is valid by forcing a refresh of the user's ID token. This is especially
    /// useful because iOS can cache sessions, leading to stale authentication states.
    ///
    /// ```swift
    /// viewModel.checkAuthState()
    /// if viewModel.isAuthenticated {
    ///     // Navigate to dashboard
    /// }
    /// ```
    func checkAuthState() {
        guard let user = Auth.auth().currentUser else {
            isAuthenticated = false
            didCheckAuthState = true
            return
        }

        user.getIDTokenResult(forcingRefresh: true) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Token refresh failed: \(error.localizedDescription)")
                    self?.isAuthenticated = false
                } else {
                    self?.isAuthenticated = true
                }
                self?.didCheckAuthState = true
            }
        }
    }

    
    /// Registers a new user using the email and password provided in the view model's properties.
    ///
    /// 
    /// - Discussion:
    /// Calls the repository’s `signUp(email:password:)` method and handles the result on the main thread. Displays
    /// an alert on error and enables loading indicators.
    ///
    /// ```swift
    /// viewModel.email = "user@example.com"
    /// viewModel.password = "securePassword123"
    /// viewModel.register()
    /// ```
    ///
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
    
    /// Logs in the user using the provided email and password credentials.
    ///
    /// 
    /// - Discussion:
    /// Uses the repository’s `signIn(email:password:)` method. Upon success, it sets the `isAuthenticated` flag.
    /// On failure, it shows an alert and stores the error message.
    ///
    /// ```swift
    /// viewModel.email = "user@example.com"
    /// viewModel.password = "securePassword123"
    /// viewModel.login()
    /// ```
    ///
    
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

