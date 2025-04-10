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

            Image("Catalog")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)

            Spacer()

            VStack(spacing: 12) {
                Button(action: {
                    coordinator.push(.register)
                }) {
                    Text("Create New Account")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(14)
                }

                Button(action: {
                    coordinator.push(.login)
                }) {
                    Text("I already have an account")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 4)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
    }
}




