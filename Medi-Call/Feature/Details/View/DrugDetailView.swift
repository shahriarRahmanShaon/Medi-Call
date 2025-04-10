//
//  DrugDetailView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct DrugDetailView: View {
    @StateObject private var viewModel: DrugDetailViewModel
    @State private var isAlertPresented = false

    init(drug: DrugDetail) {
        _viewModel = StateObject(wrappedValue: DrugDetailViewModel(drug: drug))
    }

    var body: some View {
        VStack {
            VStack {
                Image(AppConstants.Dashboard.ImageName.trayIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear, lineWidth: 4))
                    .accessibilityIdentifier("drugDetailImage")
                
                Text(viewModel.drug.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                    .accessibilityIdentifier("drugDetailName")
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if let synonym = viewModel.drug.synonym {
                        DrugDetailRow(title: AppConstants.DrugDetail.Labels.synonym, value: synonym)
                    }

                    if let tty = viewModel.drug.tty {
                        DrugDetailRow(title: AppConstants.DrugDetail.Labels.tty, value: tty)
                    }

                    if let language = viewModel.drug.language {
                        DrugDetailRow(title: AppConstants.DrugDetail.Labels.language, value: language)
                    }

                    if let suppress = viewModel.drug.suppress {
                        DrugDetailRow(title: AppConstants.DrugDetail.Labels.suppress, value: suppress)
                    }

                    if let umlscui = viewModel.drug.umlscui {
                        DrugDetailRow(title: AppConstants.DrugDetail.Labels.umlscui, value: umlscui)
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 1)
                .padding(.horizontal)
            }
            .padding(.top)

            Spacer()

            ZStack {
                AddToListButton(isLoading: viewModel.isLoading) {
                    viewModel.addToLocalDatabase()
                }
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 10)
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(AppConstants.DrugDetail.alertTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text(AppConstants.DrugDetail.alertDismiss))
            )
        }
        .navigationTitle(AppConstants.DrugDetail.navTitle)
        .navigationBarTitleDisplayMode(.inline)
        .interactiveDismissDisabled()
    }
}

struct DrugDetailRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text("\(title):")
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 100, alignment: .leading)

            Text(value)
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .accessibilityIdentifier("\(AppConstants.DrugDetail.AccessibilityIdentifier.rowPrefix)\(title)")
    }
}

struct AddToListButton: View {
    var isLoading: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 20, height: 20)
                        .accessibilityIdentifier(AppConstants.DrugDetail.AccessibilityIdentifier.addProgress)
                } else {
                    Text(AppConstants.DrugDetail.addToList)
                        .font(.body)
                        .bold()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .disabled(isLoading)
        }
        .accessibilityIdentifier(AppConstants.DrugDetail.AccessibilityIdentifier.addButton)
    }
}





