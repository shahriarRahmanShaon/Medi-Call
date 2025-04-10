//
//  AppCoordinator.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

class AppCoordinator: Coordinator {
    @Published var path = NavigationPath()

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    /// Replaces the current stack with a new route.
    ///
    /// - Parameter route: The new root route.
    /// 
    func replace(with route: Route) {
        path = NavigationPath() 
        path.append(route)
    }
}


extension AppCoordinator {
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .dashboard:
            DashboardView()
        case .drugSearch:
            DrugSearchView()
        case .drugDetail(let detail):
            DrugDetailView(drug: detail)
        case .authLanding:
            AuthLandingView()
        case .login:
            LoginView()
        case .register:
            RegisterView()
        }
    }
}


