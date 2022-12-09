//
//  ContentView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)])
    private var favorites: FetchedResults<Favorite>
    
    var body: some View {
        TabView {
            MainView(favorites: favorites)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Word")
                }
            FavoriteView(favorites: favorites)
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Favorite")
                }
            PronounceView()
                .tabItem {
                    Image(systemName: "mic")
                    Text("Pronounce")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
