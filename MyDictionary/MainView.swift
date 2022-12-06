//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word = Word.getWord()
    @State private var searching: Searching?
    @State private var searchText = ""
    @State private var isFavorite = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(word.results, id: \.lexicalEntries?.first?.lexicalCategory.id) { result in
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text(word.id)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text(result.lexicalEntries?.first?.lexicalCategory.id ?? "")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Button {
                            isFavorite.toggle()
                        } label: {
                            let image = isFavorite ? "heart" : "heart.fill"
                            
                            Image(systemName: image)
                                .foregroundColor(.red)
                        }
                        
                    }
                    
                    PronunciationView(result: result)
                    
                    Section("Translation") {
                        SenseView(senses: getSense(result: result), isExample: false)
                    }
                    
                    Section("Examples") {
                        SenseView(senses: getSense(result: result), isExample: true)
                    }
                }
            }
            .navigationTitle("Word")
            .searchable(text: $searchText) {
                ForEach(searching?.results ?? []) { result in
                    Button(result.word) {
                        fetch(word: result.word)
                    }
                    
                }
            }
        }
        .onChange(of: searchText) { text in
            fetchSearching(word: text)
        }
    }
}

extension MainView {
    
    private func getSense(result: Result) -> [Sense] {
        guard let senses = result.lexicalEntries?.first?.entries?.first?.senses else { return [] }
        return senses
    }
}

extension MainView {
    private func fetch(word: String) {
        NetworkManager.shared.fetch(word: word, fromLanguage: "en", toLanguage: "ru") { word in
            self.word = word
        }
    }
    
    private func fetchSearching(word: String) {
        NetworkManager.shared.fetchSearching(word: word, fromLanguage: "en", toLanguage: "ru") { searching in
            self.searching = searching
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
