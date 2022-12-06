//
//  FavoriteView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import SwiftUI

struct FavoriteView: View {
    
    var favorites: FetchedResults<Favorite>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favorites) { favorite in
                        
                        HStack {
                            Text(favorite.title ?? "")
                            Text("/ " + (favorite.transcription ?? ""))
                            Spacer()
                            PlayerView(sound: favorite.pronunciation ?? "")
                        }
                    }
                    .onDelete { indexSet in
                        delete(at: indexSet)
                    }
                }
                .navigationTitle("Favorite list")
            }
            
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let word = favorites[index]
            StorageManger.shared.delete(word: word)
        }
    }
}

//struct FavoriteView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let context = StorageManger.shared.viewContext
//        
//        return FavoriteView(favorites: context)
//            .environment(\.managedObjectContext, context)
//    }
//}
