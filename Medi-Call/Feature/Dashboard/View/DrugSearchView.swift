//
//  DrugSearchView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct SearchResultsView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    var results: [DrugDTO]
    
    var body: some View {
        if !results.isEmpty {
            List {
                Section(header: Text("Search Results")
                    .padding(.leading, 0)
                ) {
                    ForEach(results) { drug in
                        HStack {
                            Image("icnTray")
                                .resizable()
                                .frame(width: 32, height: 32)
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
    @EnvironmentObject var coordinator: AppCoordinator
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFocused: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField("Search Medication", text: $viewModel.keyword)
                            .disableAutocorrection(true)
                            .focused($isFocused)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 0.1)
                    )
                    .padding(.horizontal)
                    .padding(.top)

                    SearchResultsView(results: viewModel.results)

                    Spacer(minLength: 80)
                }


                VStack {
                    Spacer()
                    SearchButtonView(isLoading: viewModel.isLoading) {
                        viewModel.searchDrugs()
                        isFocused = false
                    }
                    .padding(.bottom, 16)
                }
            }
            .navigationTitle("Search Medication")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .interactiveDismissDisabled()
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
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
