//
//  Favorite.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import Foundation

struct Favorite: Hashable {
    let word: String
    let transcription: String
    let pronunciation: String
}

extension Favorite {
    
    static func getFavorite() -> [Favorite] {
        var favoriteList: [Favorite] = []
        
        favoriteList.append(DataManager.shared.favoriteOne)
        favoriteList.append(DataManager.shared.favoriteTwo)

        return favoriteList
    }
}
