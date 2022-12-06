//
//  Favorite.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import Foundation

struct Favourite: Hashable {
    let word: String
    let transcription: String
    let pronunciation: String
}

extension Favourite {
    
    static func getFavorite() -> [Favourite] {
        var favoriteList: [Favourite] = []
        
        favoriteList.append(DataManager.shared.favoriteOne)
        favoriteList.append(DataManager.shared.favoriteTwo)

        return favoriteList
    }
}
