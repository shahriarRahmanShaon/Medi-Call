//
//  DrugDetailView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct DrugDetailView: View {
    let drug: DrugDetail

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                DrugTitleView(name: drug.name)
                
                if let synonym = drug.synonym {
                    DrugDetailRow(title: "Synonym", value: synonym)
                }

                if let tty = drug.tty {
                    DrugDetailRow(title: "TTY", value: tty)
                }

                if let language = drug.language {
                    DrugDetailRow(title: "Language", value: language)
                }

                if let suppress = drug.suppress {
                    DrugDetailRow(title: "Suppress", value: suppress)
                }

                if let umlscui = drug.umlscui {
                    DrugDetailRow(title: "UMLS CUI", value: umlscui)
                }

                Spacer(minLength: 20)

                AddToListButton()
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
    var body: some View {
        Button("Add Medication to List") {
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}
