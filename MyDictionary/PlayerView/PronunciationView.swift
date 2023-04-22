//
//  PronunciationView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct PronunciationView: View {
    
    let result: ResultOfFetch
    
    var body: some View {
        ForEach(result.lexicalEntries ?? []) { lexicalEntry in
            
            ForEach(lexicalEntry.entries ?? [], id: \.homographNumber) { entry in
                
                ForEach(entry.pronunciations ?? [], id: \.self) { pronunciation in
                    
                    if let audio = pronunciation.audioFile {
                        
                        PlayButtonView(
                            sound: audio,
                            transcription: pronunciation.phoneticSpelling,
                            lexicalCategory: lexicalEntry.lexicalCategory?.text ?? "",
                            englishKind: pronunciation.dialects.first ?? ""
                        )
                    }
                }
            }
        }
    }
}


struct PronunciationView_Previews: PreviewProvider {
    static var previews: some View {
        PronunciationView(result: Word.getWord().results.first!)
    }
}
