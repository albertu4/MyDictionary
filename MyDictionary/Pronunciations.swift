//
//  Pronunciations.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 09.12.2022.
//

import SwiftUI

struct Pronunciations: View {
    @State private var pronunciationGB: [PronunciationGB] = []
    
    var body: some View {
        VStack {
            List(pronunciationGB, id: \.identifiable) { pronunciation in
                ForEach(pronunciation.results) { result in
                    PronunciationView(result: result)
                }
            }
            
            Button("tap") {
                pronunciationGB = []
                fetchPronunciationGB(language: "en-gb")
                fetchPronunciationGB(language: "en-us")
            }
        }
        
    }
    
    private func fetchPronunciationGB(language: String) {
        NetworkManager.shared.fetchPronunciationGB(word: "descend", language: language) { pronunciation in
            pronunciationGB.append(pronunciation)
        }
    }
}



struct Pronunciations_Previews: PreviewProvider {
    static var previews: some View {
        Pronunciations()
    }
}
