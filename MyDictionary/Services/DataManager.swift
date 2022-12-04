//
//  DataManager.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    var word: Word {
        Word(id: "success", results: [resultOfNoun, resultOfVerb])
    }
    
    lazy var resultOfNoun = Result(
        id: "success",
        language: "en",
        lexicalEntries: [lexicalEntryOfNoun]
    )
    
    lazy var resultOfVerb = Result(
        id: "success",
        language: "en",
        lexicalEntries: [lexicalEntryOfVerb]
    )
    
    lazy var lexicalEntryOfNoun = LexicalEntry(
        entries: [entry],
        lexicalCategory: lexicalCategoryOfNoun,
        sentences: [sentenceOne, sentenceTwo, sentenceThree]
    )
    
    lazy var lexicalEntryOfVerb = LexicalEntry(
        entries: [entry],
        lexicalCategory: lexicalCategoryOfVerb,
        sentences: [sentenceOne, sentenceTwo, sentenceThree]
    )
    
    lazy var entry = Entry(pronunciations: [pronunciation])
    
    lazy var pronunciation = Pronunciation(
        audioFile: "mp3",
        dialects: ["Foo", "Bar", "Baz"],
        phoneticSpelling: "saksess"
    )
    
    lazy var lexicalCategoryOfNoun = LexicalCategory(id: "noun", text: "Noun")
    lazy var lexicalCategoryOfVerb = LexicalCategory(id: "verb", text: "Verb")
    
    lazy var sentenceOne = Sentence(text: "sentenceOne")
    lazy var sentenceTwo = Sentence(text: "sentenceTwo")
    lazy var sentenceThree = Sentence(text: "sentenceThree")
}
