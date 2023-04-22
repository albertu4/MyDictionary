//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word = Word.getWord()
    @State private var searchingResults: [ResultOfFetch] = []
    @State private var searchText = ""
    @State private var isFavorite = false
    @State private var alertPresented = false
    var favorites: FetchedResults<Favorite>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
        NavigationView {
            
            List(word.results) { result in
                
                HStack(alignment: .firstTextBaseline) {
                    Text(word.id)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Text(result.lexicalEntries?.first?.lexicalCategory?.id ?? "")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button {
                        
                        if !favorites.contains(where: { $0.title == word.id }) {
                            isFavorite.toggle()
                            saveFavorite(result: result)
                        } else {
                            alertPresented.toggle()
                        }
                    } label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                    
                }
                
                PronunciationView(result: result)
                
//                Section("Translation") {
//                    SenseView(senses: getSense(result: result), isExample: false)
//                }
//                
//                Section("Examples") {
//                    SenseView(senses: getSense(result: result), isExample: true)
//                }
            }
            .alert("Word duplicate", isPresented: $alertPresented, actions: {}) {
                Text("Check word list")
            }
        }
        .navigationTitle("Word")
        .searchable(text: $searchText) {
            ForEach(searchingResults) { result in
                Button(result.word ?? "") {
                    fetch(word: result.word ?? "")
                }
            }
        }
        
        .onChange(of: searchText) { text in
            fetchSearching(word: text)
        }
    }
}

extension MainView {
    
    private func getSense(result: ResultOfFetch) -> [Sense] {
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
            searchingResults = searching.results
        }
    }
    
    private func saveFavorite(result: ResultOfFetch) {
        StorageManger.shared.saveWord(
            word.id,
            transcription: result.lexicalEntries?.first?.entries?.first?.pronunciations?.first?.phoneticSpelling ?? "",
            pronunciation: result.lexicalEntries?.first?.entries?.first?.pronunciations?.first?.dialects.first ?? ""
        )
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
