//
//  NotificationManager.swift
//  Medi-Call
//
//  Created by Shahriar Rahman Shaon on 10/4/25.
//

import UserNotifications
import Foundation

class NotificationManager {
    static let shared = NotificationManager()

    private init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }

    func scheduleNotification(for med: MedicineEntity, at date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Medicine Reminder"
        content.body = "Time to take \(med.synonym ?? "your medicine")."
        content.sound = .default

        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}

