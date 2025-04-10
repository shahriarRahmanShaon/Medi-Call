//
//  LoginView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = AuthViewModel()
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.title2)
                .bold()
                .padding()

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Create a password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button {
                viewModel.login()
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Log In")
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert("Login Error", isPresented: $viewModel.showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage ?? "Something went wrong")
        })
        .onChange(of: viewModel.isAuthenticated) { isAuth in
            if isAuth {
                coordinator.replace(with: .dashboard)
            }
        }
    }
}


