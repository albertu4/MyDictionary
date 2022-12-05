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
    let examples: [Example]?
}

struct Note: Decodable {
    let text: String
    let type: String
}

struct Translation: Decodable, Hashable {
    let text: String
}

struct Example: Decodable, Hashable {
    let text: String
    let translations: [Translation]
}
