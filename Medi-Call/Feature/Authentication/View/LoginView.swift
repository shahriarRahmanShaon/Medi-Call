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
            Text(AppConstants.Login.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.loginTitle)

            VStack(spacing: 16) {
                FloatingLabelTextField(
                    title: AppConstants.Login.emailFieldTitle,
                    placeholder: AppConstants.Login.emailPlaceholder,
                    text: $viewModel.email
                )
                .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.emailField)

                FloatingLabelTextField(
                    title: AppConstants.Login.passwordFieldTitle,
                    placeholder: AppConstants.Login.passwordPlaceholder,
                    text: $viewModel.password,
                    isSecure: true
                )
                .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.passwordField)
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
                        .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.loginProgress)
                } else {
                    Text(AppConstants.Login.loginButtonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
            }
            .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.loginButton)
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .alert(AppConstants.Login.loginErrorTitle, isPresented: $viewModel.showAlert, actions: {
            Button(AppConstants.Login.alertDismissButtonTitle, role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage ?? AppConstants.Login.loginErrorFallbackMessage)
        })
        .accessibilityIdentifier(AppConstants.Login.AccessibilityIdentifier.loginAlert)
        .onReceive(viewModel.$isAuthenticated) { isAuth in
            if isAuth {
                coordinator.replace(with: .dashboard)
            }
        }
    }
}



