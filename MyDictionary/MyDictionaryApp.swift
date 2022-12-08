//
//  MyDictionaryApp.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI
import UserNotifications

@main
struct MyDictionaryApp: App {
    
    @StateObject private var storageManager = StorageManger.shared
    @StateObject private var notifications = Notifications()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, storageManager.viewContext)
                .environmentObject(notifications)
                .onAppear {
                    notifications.requestAuthorization()
                }
        }
    }
}
