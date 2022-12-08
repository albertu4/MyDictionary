//
//  Notifications.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 08.12.2022.
//

import SwiftUI
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate, ObservableObject {
    
    var notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
        }
    }
    
    func scheduleNotification(notificationType: String, message: String) {
        
        let content = UNMutableNotificationContent()
        let actions = "actions"
        
        content.title = notificationType
        content.body = message
        content.sound = .default
        content.categoryIdentifier = actions
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content,
                                            trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
