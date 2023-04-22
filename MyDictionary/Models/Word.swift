//
//  Word.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import Foundation

struct Word: Decodable {
    let id: String
    let results: [ResultOfFetch]
}

struct ResultOfFetch: Decodable, Identifiable {
    let id: String?
    let lexicalEntries: [LexicalEntry]?
    let word: String?
}

struct LexicalEntry: Decodable, Identifiable {
    let entries: [Entry]?
    let lexicalCategory: LexicalCategory?
    
    var id: String {
        UUID().uuidString
    }
}

struct LexicalCategory: Decodable {
    let id: String
    let text: String
}

struct Entry: Decodable {
    let homographNumber: String?
    let pronunciations: [Pronunciation]?
    let senses: [Sense]?
}

struct Pronunciation: Decodable, Hashable {
    let audioFile: String?
    let dialects: [String]
    let phoneticSpelling: String
    
}

struct Sense: Decodable, Identifiable {
    let id: String
    let translations: [Translation]?
    let examples: [Example]?
    let definitions: [String]?
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

struct Searching: Decodable {
    let results: [ResultOfFetch]
}

struct PronunciationGB: Decodable {
//    var id: String
    let results: [ResultOfFetch]
    
    var identifiable: String {
        UUID().uuidString
    }
}

struct Definition: Decodable {
    let results: [ResultOfFetch]
}

extension Word {
    static func getWord() -> Word {
        let resultOfNoun = DataManager.shared.resultOfNoun
        let word = Word(id: "success", results: [resultOfNoun])
        return word
    }
}
