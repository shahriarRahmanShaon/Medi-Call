//
//  DrugSearchView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct SearchResultsView: View {
    var results: [DrugDTO]
    
    var body: some View {
        if !results.isEmpty {
            List {
                Section(header: Text("Search Results")
                    .padding(.leading, 0)
                ) {
                    ForEach(results) { drug in
                        HStack {
                            Image(systemName: "pill.fill")
                                .foregroundColor(.blue)
                                .padding(.trailing, 5)
                            NavigationLink(destination: DrugDetailView(drug: DTOMapper.mapToDetailModel(from: drug))) {
                                Text(drug.synonym ?? "")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SearchButtonView: View {
    var isLoading: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding(.trailing, 8)
            }
            Text("Search")
                .foregroundColor(.white)
        }
        .modifier(ButtonModifier(isLoading: isLoading, action: action))
    }
}


struct DrugSearchView: View {
    @EnvironmentObject private var viewModel: DashboardViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Medication", text: $viewModel.keyword)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 1)
                    )
                    .focused($isFocused)
                    .padding(.horizontal)
                    .padding(.top)
                
                SearchResultsView(results: viewModel.results)
                if isFocused {
                    SearchButtonView(isLoading: viewModel.isLoading) {
                        viewModel.searchDrugs()
                    }
                    .padding(.bottom)
                }
                Spacer()
            }
            .navigationTitle("Search Medication")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back")
                }
            })
        }
    }
}


private struct ButtonModifier: ViewModifier {
    var isLoading: Bool
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
            .disabled(isLoading)
            .onTapGesture {
                action()
            }
    }
}
