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
        }
    }
}

