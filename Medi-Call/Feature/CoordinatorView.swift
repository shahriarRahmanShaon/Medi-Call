//
//  CoordinatorView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()
    @StateObject var authViewModel = AuthViewModel()

    /// The main entry point view that manages routing based on authentication state.
    ///
    /// - Returns: Displays a `NavigationStack` if authentication state has been checked, otherwise a `ProgressView`.
    /// - Discussion:
    /// This view initializes and observes `AppCoordinator` and `AuthViewModel` instances. When the view appears, it checks
    /// the user's authentication state. Depending on whether the user is authenticated, it navigates to the `.dashboard`
    /// or `.authLanding` route.
    ///
    /// The routing is handled via `NavigationStack` and custom `Route` enums resolved through the coordinator:
    ///
    /// ```swift
    /// CoordinatorView()
    /// ```
    ///
    /// On appear:
    /// ```swift
    /// .onAppear {
    ///     authViewModel.checkAuthState()
    /// }
    /// ```
    
    var body: some View {
        Group {
            if authViewModel.didCheckAuthState {
                NavigationStack(path: $coordinator.path) {
                    coordinator.view(for: authViewModel.isAuthenticated ? .dashboard : .authLanding)
                        .navigationDestination(for: Route.self) { route in
                            coordinator.view(for: route)
                        }
                }
                .environmentObject(coordinator)
                .environmentObject(authViewModel)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            authViewModel.checkAuthState()
        }
    }
}


