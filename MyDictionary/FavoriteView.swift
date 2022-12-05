//
//  FavoriteView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import SwiftUI

struct FavoriteView: View {
    let favorites: [Favorite]
    
    var body: some View {
        NavigationView {
            
            List(favorites, id: \.word) { favorite in
                HStack {
                    Text(favorite.word)
                    Text("/ " + favorite.transcription)
                    Spacer()
                    PlayerView(sound: favorite.pronunciation)
                }
            }
            .navigationTitle("Favorite list")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favorites: Favorite.getFavorite())
    }
}
