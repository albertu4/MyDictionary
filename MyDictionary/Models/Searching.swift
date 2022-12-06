//
//  Searching.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 06.12.2022.
//

import Foundation

struct Searching: Decodable {
    let results: [SearchingResult]
}

struct SearchingResult: Decodable, Identifiable {
    let id: String
    let word: String
}
