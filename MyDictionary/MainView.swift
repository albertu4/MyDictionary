//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word = Word.getWord()
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(word.results, id: \.lexicalEntries?.first?.lexicalCategory.id) { result in
                    
                    Text(word.id)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    PronunciationView(result: result)
                    
                    Section("Translation") {
                        SenseView(senses: getSense(result: result), isExample: false)
                    }
                    
                    Section("Examples") {
                        SenseView(senses: getSense(result: result), isExample: true)
                    }
                }
                
                Button("Start") {
                    fetchWord()
                }
            }
            .navigationTitle("Word")
            .searchable(text: $searchText)
        }
    }
    
    private var searchableWord: [String] {
        var word: [String] = []
        NetworkManager.shared.fetchSearchableWord(url: Link.shared.searching) { result in
            word.append(result.label ?? "")
        }
        
        return searchText == "" ? word : word.filter{ $0.contains(searchText.lowercased())
        }
    }
}
    
extension MainView {
    
    private func getCategory(result: Result) -> String {
        guard let category = result.lexicalEntries?.first?.lexicalCategory.text else { return "" }
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
        guard let sentences = result.lexicalEntries?.first?.sentences else { return []}
        return sentences
    }
    
    private func getSense(result: Result) -> [Sense] {
        guard let senses = result.lexicalEntries?.first?.entries?.first?.senses else { return [] }
        return senses
    }
}
    
extension MainView {
    private func fetchWord() {
        
//        NetworkManager.shared.fetchWord(url: Link.shared.sentences) { word in
//            self.word = word
//        }
        
        NetworkManager.shared.fetchWord(url: Link.shared.pronunciation) { word
            in
            self.word = word
        }
    }
    
//    private func fetchSearchableWord() {
//        NetworkManager.shared.fetchSearchableWord(url: Link.shared.searching) { searching in
//            searchText = searching.label ?? "error"
//
//        }
//    }
    
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
