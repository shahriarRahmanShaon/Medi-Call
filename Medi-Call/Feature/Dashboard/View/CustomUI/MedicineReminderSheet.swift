//
//  MedicineReminderSheet.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import SwiftUI

struct MedicineReminderSheet: View {
    @Environment(\.dismiss) var dismiss

    @Binding var selectedMed: MedicineEntity?
    @Binding var reminderTime: Date
    var medicines: [MedicineEntity]

    var body: some View {
        VStack(spacing: 20) {
            Text("Set Medicine Reminder")
                .font(.headline)

            Picker("Select Medicine", selection: $selectedMed) {
                ForEach(medicines, id: \.self) { med in
                    Text(med.synonym ?? "Unnamed").tag(Optional(med))
                }
            }
            .pickerStyle(.wheel)

            DatePicker("Reminder Time", selection: $reminderTime, displayedComponents: .hourAndMinute)

            Button("Set Reminder") {
                if let med = selectedMed {
                    NotificationManager.shared.scheduleNotification(for: med, at: reminderTime)
                    dismiss()
                }
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

