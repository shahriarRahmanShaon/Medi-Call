//
//  DashboardView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var showSearch = false
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack {
                Text("My Medications")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                if viewModel.savedMeds.isEmpty {
                    Text("No saved medications.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.savedMeds, id: \.id) { med in
                            HStack {
                                Image("icnTray")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)

                                VStack(alignment: .leading) {
                                    Text("Drug Id: \(med.id)").foregroundColor(.gray)
                                    if let synonym = med.synonym {
                                        Text(synonym)
                                            .font(.subheadline)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let med = viewModel.savedMeds[index]
                                viewModel.deleteDrug(med)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .background(Color.clear)
                }

                Spacer()

                Button(action: {
                    showSearch.toggle()
                }) {
                    Label("Search Medications", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .sheet(isPresented: $showSearch, onDismiss: {
                    viewModel.fetchSavedMeds()
                }) {
                    DrugSearchView()
                        .environmentObject(viewModel)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}





