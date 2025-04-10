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


