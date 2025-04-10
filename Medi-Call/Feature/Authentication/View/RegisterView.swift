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
        VStack {
            //Spacer()

            Text("Create New Account")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.bottom, 40)

            VStack(spacing: 16) {
                FloatingLabelTextField(title: "Name", placeholder: "Alice", text: $viewModel.name)
                FloatingLabelTextField(title: "Email", placeholder: "alice@email.com", text: $viewModel.email)
                FloatingLabelTextField(title: "Password", placeholder: "••••••••", text: $viewModel.password, isSecure: true)
            }
            .padding(.horizontal)

            Spacer()

            Button(action: {
                viewModel.register()
            }) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .alert("Registration Error", isPresented: $viewModel.showAlert, actions: {
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


