//
//  CoordinatorView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.view(for: .authLanding)
                .navigationDestination(for: Route.self) { route in
                    coordinator.view(for: route)
                }
        }
        .environmentObject(coordinator)
    }
}

