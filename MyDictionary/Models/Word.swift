//
//  Word.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import Foundation

struct Word: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let id: String
    let language: String
    let lexicalEntries: [LexicalEntry]
}

struct LexicalEntry: Decodable {
    let entries: [Entry]
}

struct Entry: Decodable {
    let pronunciations: [Pronounce]
}

struct Pronounce: Decodable {
    let audioFile: String
    let dialects: [String]
    let phoneticSpelling: String
}

enum Link: String {
    case word = "https://wordsapiv1.p.mashape.com/words/money"
}
