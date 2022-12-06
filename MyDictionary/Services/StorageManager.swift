//
//  StorageManager.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 06.12.2022.
//

import CoreData

class StorageManger: ObservableObject {
    
    static let shared = StorageManger()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    let viewContext: NSManagedObjectContext
    
    init() {
        viewContext = persistentContainer.viewContext
    }
}

extension StorageManger {
    
    func fetchData(completion: (Result<[Favorite], Error>) -> Void) {
        let fetchRequest = Favorite.fetchRequest()
        
        do {
            let favorites = try viewContext.fetch(fetchRequest)
            completion(.success(favorites))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    // Save data
    func saveWord(_ title: String, transcription: String, pronunciation: String) {
        let word = Favorite(context: viewContext)
        word.id = UUID()
        word.title = title
        word.transcription = transcription
        word.pronunciation = pronunciation
        saveContext()
    }
    
    func delete(word: Favorite) {
        viewContext.delete(word)
        saveContext()
    }
    
    func saveWords(_ title: String, transcription: String, pronunciation: String, context: NSManagedObjectContext) {
        let word = Favorite(context: context)
        word.id = UUID()
        word.title = title
        word.transcription = transcription
        word.pronunciation = pronunciation
        saveContext()
    }
    
    func deletes(word: Favorite) {
        viewContext.delete(word)
        saveContext()
    }
    
    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
