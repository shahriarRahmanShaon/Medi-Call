//
//  RegisterView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Create New Account")
                .font(.title2)
                .bold()
                .padding()

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)

            SecureField("Create a password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button {
                viewModel.register()
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Create Account")
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert("Registration Error", isPresented: $viewModel.showAlert, actions: {
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


