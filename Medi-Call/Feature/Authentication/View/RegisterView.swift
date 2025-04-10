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
            Text(AppConstants.Register.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.bottom, 40)
                .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.registerTitle)

            VStack(spacing: 16) {
                FloatingLabelTextField(
                    title: AppConstants.Register.nameFieldTitle,
                    placeholder: AppConstants.Register.namePlaceholder,
                    text: $viewModel.name
                )
                .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.nameField)

                FloatingLabelTextField(
                    title: AppConstants.Register.emailFieldTitle,
                    placeholder: AppConstants.Register.emailPlaceholder,
                    text: $viewModel.email
                )
                .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.emailField)

                FloatingLabelTextField(
                    title: AppConstants.Register.passwordFieldTitle,
                    placeholder: AppConstants.Register.passwordPlaceholder,
                    text: $viewModel.password,
                    isSecure: true
                )
                .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.passwordField)
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
                        .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.registerProgress)
                } else {
                    Text(AppConstants.Register.createAccountButtonTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
            }
            .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.registerButton)
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .alert(AppConstants.Register.registrationErrorTitle, isPresented: $viewModel.showAlert, actions: {
            Button(AppConstants.Register.alertDismissButtonTitle, role: .cancel) { }
        }, message: {
            Text(viewModel.errorMessage ?? AppConstants.Register.registrationErrorFallbackMessage)
        })
        .accessibilityIdentifier(AppConstants.Register.AccessibilityIdentifier.registerAlert)
        .onReceive(viewModel.$isAuthenticated) { isAuth in
            if isAuth {
                coordinator.replace(with: .dashboard)
            }
        }
    }
}


