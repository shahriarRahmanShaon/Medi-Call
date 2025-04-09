//
//  DrugDetailView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct DrugDetailView: View {
    @StateObject private var viewModel: DrugDetailViewModel

    init(drug: DrugDetail) {
        _viewModel = StateObject(wrappedValue: DrugDetailViewModel(drug: drug))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                DrugTitleView(name: viewModel.drug.name)

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

                Spacer(minLength: 20)

                AddToListButton {
                    viewModel.addToLocalDatabase()
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct DrugTitleView: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.title)
            .bold()
    }
}

struct DrugDetailRow: View {
    let title: String
    let value: String

    var body: some View {
        Text("\(title): \(value)")
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

struct AddToListButton: View {
    var action: () -> Void

    var body: some View {
        Button("Add Medication to List") {
            action()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

