//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word = Word.getWord()
//    @State private var senses: [Sense] = []
//    @State private var entry: Entry?
//    @State private var translation: Translation?
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
    
                List(word.results, id: \.lexicalEntries.first?.lexicalCategory.id) { result in
                    
                    Text(word.id)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    PronunciationView(result: result)
                    
                    Section("Translation") {
                        SenseView(senses: getSense(result: result))
                    }
                    
                    Section(getCategory(result: result)) {
                        CategorySentence(sentences: getSentences(result: result))
                    }
                }
                .listStyle(.sidebar)
                
                Button("Start") {
                    fetchWord()
                }
            }
                .navigationTitle(word.id)
        }
    }
    
    private func getCategory(result: Result) -> String {
        guard let category = result.lexicalEntries.first?.lexicalCategory.text else { return "" }
        return category
    }
    
    private func getSentences(result: Result) -> [Sentence] {
        let sentences = getSentence(result: result)
        return getLimitedCount(sentences: sentences)
    }
    
    private func getLimitedCount(sentences: [Sentence]) -> [Sentence] {
        var newSentences: [Sentence] = []
        let iterationCount = min(5, sentences.count)
        let shuffledSentences = sentences.shuffled()
        for index in 0..<iterationCount {
            newSentences.append(shuffledSentences[index])
        }
        return newSentences
    }
    
    private func getSentence(result: Result) -> [Sentence] {
        guard let sentences = result.lexicalEntries.first?.sentences else { return []}
        return sentences
    }
    
    private func getSense(result: Result) -> [Sense] {
        guard let senses = result.lexicalEntries.first?.entries?.first?.senses else { return [] }
        return senses
    }
    
    
    
    private func fetchWord() {
        
//        NetworkManager.shared.fetchWord(url: Link.shared.sentences) { word in
//            self.word = word
//        }
        
        NetworkManager.shared.fetchWord(url: Link.shared.pronunciation) { word
            in
            self.word = word
        }
    }
    
//    private func fetchSenses() {
//        NetworkManager.shared.fetchSense(url: Link.shared.translation) { senses in
//            self.senses = senses
//        }
//    }
//
//    private func fetchEntry() {
//        NetworkManager.shared.fetchEntry(url: Link.shared.translation) { entry in
//            self.entry = entry
//        }
//    }
//
//    private func fetchTranslation() {
//        NetworkManager.shared.fetchTranslation(url: Link.shared.translation) { translation in
//            self.translation = translation
//        }
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
