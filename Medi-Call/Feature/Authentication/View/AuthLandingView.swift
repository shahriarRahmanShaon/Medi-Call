//
//  AuthLandingView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct AuthLandingView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(systemName: "c.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Spacer()

            Button("Create New Account") {
                coordinator.push(.register)
            }
            .buttonStyle(.borderedProminent)

            Button("I already have an account") {
                coordinator.push(.login)
            }
            .font(.footnote)
            .foregroundColor(.blue)

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

