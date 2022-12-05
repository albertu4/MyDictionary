//
//  DataManager.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    let favoriteOne = Favorite(
        word: "success",
        transcription: "səkˈsɛs",
        pronunciation: "https://audio.oxforddictionaries.com/en/mp3/success_us_1.mp3"
    )
    
    let favoriteTwo = Favorite(
        word: "super",
        transcription: "super",
        pronunciation: "https://audio.oxforddictionaries.com/en/mp3/success_us_1.mp3"
    )
    
    var word: Word {
        Word(id: "success", results: [resultOfNoun])
    }
    
    lazy var resultOfNoun = Result(
        id: "success",
        label: "success label",
        language: "en",
        lexicalEntries: [lexicalEntryOfNoun]
    )
    
//    lazy var resultOfVerb = Result(
//        id: "success",
//        language: "en",
//        lexicalEntries: [lexicalEntryOfVerb]
//    )
    
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
    
    lazy var entry = Entry(pronunciations: [pronunciationUK, pronunciationUS], senses: [sence])
    
    lazy var sence = Sense(
        id: "1",
        notes: [note],
        translations: [translation],
        examples: [example]
    )
    
    lazy var example = Example(
        text: "Example text",
        translations: [translation]
    )
    
    lazy var note = Note(text: "note note note note note", type: "noteType")
    
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
    
    lazy var sentenceOne = Sentence(text: "sentenceOne")
    lazy var sentenceTwo = Sentence(text: "sentenceTwo")
    lazy var sentenceThree = Sentence(text: "sentenceThree")
}
