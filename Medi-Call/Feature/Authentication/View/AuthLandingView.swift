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
        VStack {
            Spacer()
            Image(AppConstants.AuthLanding.catalogImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .accessibilityIdentifier(AppConstants.AuthLanding.AccessibilityIdentifier.catalogImage)

            Spacer()

            VStack(spacing: 12) {
                Button(action: {
                    coordinator.push(.register)
                }) {
                    Text(AppConstants.AuthLanding.createAccountTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(14)
                }
                .accessibilityIdentifier(AppConstants.AuthLanding.AccessibilityIdentifier.createAccountButton)

                Button(action: {
                    coordinator.push(.login)
                }) {
                    Text(AppConstants.AuthLanding.loginTitle)
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 4)
                }
                .accessibilityIdentifier(AppConstants.AuthLanding.AccessibilityIdentifier.loginButton)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
}
