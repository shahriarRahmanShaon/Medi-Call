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
                Image("icnTray")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear, lineWidth: 4))
                
                Text(viewModel.drug.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
            }
            .padding()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if let synonym = viewModel.drug.synonym {
                        DrugDetailRow(title: "Synonym", value: synonym)
                    }

                    if let tty = viewModel.drug.tty {
                        DrugDetailRow(title: "TTY", value: tty)
                    }

                    if let language = viewModel.drug.language {
                        DrugDetailRow(title: "Language", value: language)
                    }

                    if let suppress = viewModel.drug.suppress {
                        DrugDetailRow(title: "Suppress", value: suppress)
                    }

                    if let umlscui = viewModel.drug.umlscui {
                        DrugDetailRow(title: "UMLS CUI", value: umlscui)
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width-40)
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
            Alert(title: Text("Success"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("Details")
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
                } else {
                    Text("Add Medication to List")
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
    }
}




