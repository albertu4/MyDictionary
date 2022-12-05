//
//  Word.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import Foundation

struct Word: Decodable, Identifiable {
    let id: String
    let results: [Result]
}

struct Result: Decodable {
    let id: String
    let language: String
    let lexicalEntries: [LexicalEntry]
}

struct LexicalEntry: Decodable {
    let entries: [Entry]?
    let lexicalCategory: LexicalCategory
    let sentences: [Sentence]?
}

struct LexicalCategory: Decodable {
    let id: String
    let text: String
}

struct Entry: Decodable {
    let pronunciations: [Pronunciation]
//    let translations: [Translation]
    let senses: [Sense]
//    let synonyms: [String]?
//    let antonyms: [String]?
//    let examples: [String]?
//    let domains: [String]?
}

extension Word {
    static func getWord() -> Word {
        let resultOfNoun = DataManager.shared.resultOfNoun
        let resultOfVerb = DataManager.shared.resultOfVerb
        let word = Word(id: "success", results: [resultOfNoun, resultOfVerb])
        return word
    }
}
