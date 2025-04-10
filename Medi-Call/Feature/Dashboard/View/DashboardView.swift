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
                Text(AppConstants.Dashboard.title)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .accessibilityIdentifier(AppConstants.Dashboard.AccessibilityIdentifier.title)
                
                if viewModel.savedMeds.isEmpty {
                    Text(AppConstants.Dashboard.emptyStateMessage)
                        .foregroundColor(.gray)
                        .padding()
                        .accessibilityIdentifier(AppConstants.Dashboard.AccessibilityIdentifier.emptyStateText)
                } else {
                    List {
                        ForEach(viewModel.savedMeds, id: \.id) { med in
                            HStack {
                                Image(AppConstants.Dashboard.ImageName.trayIcon)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                                
                                VStack(alignment: .leading) {
                                    Text("\(AppConstants.Dashboard.drugIdPrefix) \(med.id)").foregroundColor(.gray)
                                    if let synonym = med.synonym {
                                        Text(synonym)
                                            .font(.subheadline)
                                    }
                                }
                            }
                            .padding(.vertical, 4)
                            .accessibilityIdentifier("\(AppConstants.Dashboard.AccessibilityIdentifier.medicationCell)_\(med.id)")
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
                    Label(AppConstants.Dashboard.searchButtonTitle, systemImage: "plus.circle.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                }
                .accessibilityIdentifier(AppConstants.Dashboard.AccessibilityIdentifier.searchButton)
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
