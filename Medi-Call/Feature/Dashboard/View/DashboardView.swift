//
//  DashboardView.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 9/4/25.
//

import SwiftUI

struct DashboardView: View {
    @State private var showSearch = false

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                showSearch.toggle()
            }) {
                Text("Search Medications")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
            .sheet(isPresented: $showSearch) {
                DrugSearchView()
            }
        }
        .navigationTitle("My Medications")
    }
}

