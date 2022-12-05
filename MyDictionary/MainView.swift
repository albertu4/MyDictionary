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
            .searchable(text: $searchText)
        }
        .onChange(of: searchText) { text in
            fetch(word: text)
        }
    }
    
//    private var searchableWord: [String] {
//        var word: [String] = []
//        NetworkManager.shared.fetchSearchableWord(url: Link.shared.searching) { result in
//            word.append(result.label ?? "")
//        }
//
//        return searchText == "" ? word : word.filter{ $0.contains(searchText.lowercased())
//        }
//    }
}
    
extension MainView {
    
    private func getCategory(result: Result) -> String {
        guard let category = result.lexicalEntries?.first?.lexicalCategory.text else { return "" }
        return category
    }
      
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
