//
//  PronunciationView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct PronunciationView: View {
    
    let result: Result
    
    var body: some View {
        ForEach(getPronunciations(result: result), id: \.self) { pronunciation in
            
            PlayButtonView(
                sound: pronunciation.audioFile,
                transcription: pronunciation.phoneticSpelling,
                englishKind: pronunciation.dialects.first ?? ""
            )
        }
    }
    
    private func getPronunciations(result: Result) -> [Pronunciation] {
        guard let pronunciations = result.lexicalEntries?.first?.entries?.first?.pronunciations else { return [] }
        return pronunciations
    }
}

struct PronunciationView_Previews: PreviewProvider {
    static var previews: some View {
        PronunciationView(result: Word.getWord().results.first!)
    }
}
