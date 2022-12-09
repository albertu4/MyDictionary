//
//  PronounceView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 09.12.2022.
//

import SwiftUI

struct PronounceView: View {
    @State private var pronunciations: Pronounce?
    
    var body: some View {
        VStack {
            Text(pronunciations?.audioFile ?? "")
            
            Button("tap") {
                fetchPronunciation()
            }
        }
        
    }
    
    private func fetchPronunciation() {
        NetworkManager.shared.fetchPronunciation(word: "win", language: "en-gb") { pronunciations in
            self.pronunciations = pronunciations
        }
    }
}


struct PronounceView_Previews: PreviewProvider {
    static var previews: some View {
        PronounceView()
    }
}
