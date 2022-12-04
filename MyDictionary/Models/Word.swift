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
    let pronunciations: [Pronunciation]?
}

enum Link: String {
    
    case word = "https://od-api.oxforddictionaries.com:443/api/v2/translations/en/ru/ace?strictMatch=false&fields=pronunciations"
    
    case translate = "https://od-api.oxforddictionaries.com/api/v2/translations/en/ru/ace?strictMatch=false&fields=translations"
    
//    case sentences =
//            "https://od-api.oxforddictionaries.com:443/api/v2/sentences/\(language)/\(word_id)?strictMatch=\(strictMatch)"
}


extension Word {
    static func getWord() -> Word {
        let resultOfNoun = DataManager.shared.resultOfNoun
        let resultOfVerb = DataManager.shared.resultOfVerb
        let word = Word(id: "success", results: [resultOfNoun, resultOfVerb])
        return word
    }
}
