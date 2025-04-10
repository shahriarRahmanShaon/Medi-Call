//
//  FloatingLabelTextField.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct FloatingLabelTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.top, 3)

            if isSecure {
                SecureField(placeholder, text: $text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.vertical, 8)
            } else {
                TextField(placeholder, text: $text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.vertical, 8)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(Color(.systemGray5))
        .cornerRadius(10)
    }
}
