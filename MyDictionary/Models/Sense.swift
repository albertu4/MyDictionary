//
//  Sense.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import Foundation

struct Sense: Decodable, Identifiable {
    let id: String
    let notes: [Note]?
    let translations: [Translation]?
}

struct Note: Decodable {
    let text: String
    let type: String
}

struct Translation: Decodable, Hashable {
    let text: String
}
