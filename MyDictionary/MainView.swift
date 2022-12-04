//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word = Word.getWord()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                HStack {
                    Text(word.id)
                        .font(.title)
                        .fontWeight(.bold)
                    .foregroundColor(.blue)
                    
                    PlayButtonView(sound: "", text: "text")
                    PlayButtonView(sound: "", text: "text")
                }
                .padding()
                
                
                List(word.results, id: \.lexicalEntries.first?.lexicalCategory.id) { result in
                    
                    Section(result.lexicalEntries.first?.lexicalCategory.text ?? "Category") {
                        
                        CategorySentence(sentences: getSentence(result: result))
                    }
                }
                
                Button("Start") {
                    fetchWord()
                }
            }
            .navigationTitle("Word")
            
        }
        
    }
    
//    private func getSound(word: Word) -> String {
//        guard let sound = result.lexicalEntries.first?.entries.first?.pronunciations[1]?.audioFile else { return "" }
//
//    }
    
//    private func getPronunciations(result: Result) -> [Pronunciation] {
//        guard let pronunciations = result.lexicalEntries.
//    }
    
    private func getSentence(result: Result) -> [Sentence] {
        guard let sentences = result.lexicalEntries.first?.sentences else { return []}
        return sentences
    }
    
    private func fetchWord() {
        NetworkManager.shared.fetchWord { word in
            self.word = word
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//                Text(result.lexicalEntries.first?.sentences?.first?.text ?? "")

//                HStack {
//                    PlayerView(sound: result.lexicalEntries.first?.entries.first?.pronunciations.first??.audioFile ?? "")
//
//                    Text(result.lexicalEntries.first?.entries.first?.pronunciations.first??.phoneticSpelling ?? "Foo")
//
//                    Text(result.lexicalEntries.first?.entries.first?.pronunciations.first??.dialects.first ?? "Bar")
//                        .font(.footnote)
//                        .foregroundColor(.red)
//                }

//                HStack {
//                    PlayerView(sound: result.lexicalEntries.first?.entries.first?.pronunciations[1]?.audioFile ?? "")
//
//                    Text(result.lexicalEntries.first?.entries.first?.pronunciations[1]?.phoneticSpelling ?? "Foo")
//
//                    Text(result.lexicalEntries.first?.entries.first?.pronunciations[1]?.dialects.first ?? "Bar")
//                        .font(.footnote)
//                        .foregroundColor(.red)
//                }
//
