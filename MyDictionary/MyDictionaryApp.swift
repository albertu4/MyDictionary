//
//  MyDictionaryApp.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

@main
struct MyDictionaryApp: App {
    
    @StateObject private var storageManager = StorageManger.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, storageManager.viewContext)
        }
    }
}
