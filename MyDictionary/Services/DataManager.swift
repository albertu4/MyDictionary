//
//  DataManager.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    let favoriteOne = Favourite(
        word: "success",
        transcription: "səkˈsɛs",
        pronunciation: "https://audio.oxforddictionaries.com/en/mp3/success_us_1.mp3"
    )
    
    let favoriteTwo = Favourite(
        word: "super",
        transcription: "super",
        pronunciation: "https://audio.oxforddictionaries.com/en/mp3/success_us_1.mp3"
    )
    
    var word: Word {
        Word(id: "success", results: [resultOfNoun])
    }
    
    lazy var resultOfNoun = ResultTranslation(
        id: "success",
        lexicalEntries: [lexicalEntryOfNoun]
    )
    
//    lazy var resultOfVerb = Result(
//        id: "success",
//        language: "en",
//        lexicalEntries: [lexicalEntryOfVerb]
//    )
    
    lazy var lexicalEntryOfNoun = LexicalEntry(
        entries: [entry],
        lexicalCategory: lexicalCategoryOfNoun
    )
    
    lazy var lexicalEntryOfVerb = LexicalEntry(
        entries: [entry],
        lexicalCategory: lexicalCategoryOfVerb
    )
    
    lazy var entry = Entry(pronunciations: [pronunciationUK, pronunciationUS], senses: [sence])
    
    lazy var sence = Sense(
        id: "1",
        translations: [translation],
        examples: [example]
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
    lazy var lexicalCategoryOfVerb = LexicalCategory(id: "verb", text: "Verb")
}
