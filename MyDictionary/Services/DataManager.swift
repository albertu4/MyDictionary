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
        Word(id: "success", results: [resultOfNoun])
    }
    
    lazy var resultOfNoun = ResultOfFetch(
        id: "success",
        lexicalEntries: [lexicalEntryOfNoun],
        word: "word success"
    )
    
    lazy var lexicalEntryOfNoun = LexicalEntry(
        entries: [entry],
        lexicalCategory: lexicalCategoryOfNoun
    )
    
    lazy var entry = Entry(homographNumber: "1", pronunciations: [pronunciationUK, pronunciationUS], senses: [sence])
    
    lazy var sence = Sense(
        id: "1",
        translations: [translation],
        examples: [example],
        definitions: ["one", "two"]
    )
    
    lazy var example = Example(
        text: "Example text",
        translations: [translation]
    )
    
    lazy var translation = Translation(text: "translationOne")
    lazy var translationTwo = Translation(text: "translationTwo")
    
    lazy var pronunciationUK = Pronunciation(
        audioFile: "https://audio.oxforddictionaries.com/en/mp3/success_gb_1.mp3",
        dialects: ["British English"],
        phoneticSpelling: "səkˈsɛs"
    )
    
    lazy var pronunciationUS = Pronunciation(
        audioFile: "https://audio.oxforddictionaries.com/en/mp3/success_us_1.mp3",
        dialects: ["American English"],
        phoneticSpelling: "səkˈsɛs"
    )
    
    lazy var lexicalCategoryOfNoun = LexicalCategory(id: "noun", text: "Noun")
}
