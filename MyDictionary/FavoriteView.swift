//
//  FavoriteView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var favorites: [Favorite] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favorites, id: \.title) { favorite in
                        
                        HStack {
                            Text(favorite.title ?? "")
                            Text("/ " + (favorite.transcription ?? ""))
                            Spacer()
                            PlayerView(sound: favorite.pronunciation ?? "")
                        }
                    }
                    .onDelete { indexSet in
                        delete(at: indexSet)
                        fetchData()
                    }
                }
                .navigationTitle("Favorite list")
                
                Button("add") {
                    
                    if !favorites.contains(where: { $0.title == "name" }) {
                        
                        addWord()
                        
                        withAnimation {
                            fetchData()
                        }
                    }
                    
                    
                }
            }
            
        }
        .onAppear {
            fetchData()
        }
    }
    
    private func addWord() {
        StorageManger.shared.saveWord(
            "name",
            transcription: "transc",
            pronunciation: "pronun"
        )
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let word = favorites[index]
            StorageManger.shared.delete(word: word)
        }
    }
    
    private func fetchData() {
        StorageManger.shared.fetchData { result in
            switch result {
            case .success(let success):
                favorites = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
