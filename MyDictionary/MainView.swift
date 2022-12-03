//
//  MainView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var word: Word?
    
    var body: some View {
        
        NavigationView {
            
            List(word?.results ?? [], id: \.id) { result in
                Text(result.id)
                    .font(.title)
                
                HStack {
                    PlayerView(sound: result.lexicalEntries.first?.entries.first?.pronunciations.first?.audioFile ?? "")
                    
                    Text(result.lexicalEntries.first?.entries.first?.pronunciations.first?.phoneticSpelling ?? "Foo")
                    
                    Text(result.lexicalEntries.first?.entries.first?.pronunciations.first?.dialects.first ?? "Bar")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                HStack {
                    PlayerView(sound: result.lexicalEntries.first?.entries.first?.pronunciations[1].audioFile ?? "")
                    
                    Text(result.lexicalEntries.first?.entries.first?.pronunciations[1].phoneticSpelling ?? "Foo")
                    
                    Text(result.lexicalEntries.first?.entries.first?.pronunciations[1].dialects.first ?? "Bar")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
            }
            .navigationTitle("Word")
            
        }
        .onTapGesture {
            fetchWord()
        }
        
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
