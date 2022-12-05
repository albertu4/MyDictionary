//
//  ContentView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct ContentView: View {
    private let favoriteList = Favorite.getFavorite()
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Word")
                }
            FavoriteView(favorites: favoriteList)
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Favorite")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
