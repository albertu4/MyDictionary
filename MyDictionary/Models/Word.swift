//
//  Word.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import Foundation

struct Word: Decodable, Identifiable {
    let id: String
    let results: [ResultTranslation]
}

struct ResultTranslation: Decodable {
    let id: String
    let lexicalEntries: [LexicalEntry]?
}

struct LexicalEntry: Decodable {
    let entries: [Entry]?
    let lexicalCategory: LexicalCategory
}

struct LexicalCategory: Decodable {
    let id: String
    let text: String
}

struct Entry: Decodable {
    let pronunciations: [Pronunciation]
    let senses: [Sense]
}

extension Word {
    static func getWord() -> Word {
        let resultOfNoun = DataManager.shared.resultOfNoun
        let word = Word(id: "success", results: [resultOfNoun])
        return word
    }
}
