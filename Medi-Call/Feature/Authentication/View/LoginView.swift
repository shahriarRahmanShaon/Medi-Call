//
//  LoginView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 30) {
            Text("Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)

            VStack(spacing: 16) {
                FloatingLabelTextField(title: "Email", placeholder: "example@gmail.com", text: $viewModel.email)
                FloatingLabelTextField(title: "Create a password", placeholder: "••••••••", text: $viewModel.password, isSecure: true)
            }
            .padding(.horizontal)

            Spacer()

            Button(action: {
                viewModel.login()
            }) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .alert("Login Error", isPresented: $viewModel.showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage ?? "Something went wrong")
        })
        .onReceive(viewModel.$isAuthenticated) { isAuth in
            if isAuth {
                coordinator.replace(with: .dashboard)
            }
        }
    }
}


