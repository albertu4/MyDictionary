//
//  SenseView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct SenseView: View {
    let senses: [Sense]
    
    var body: some View {
        ForEach(senses, id: \.id) { sense in
            VStack(alignment: .leading) {
                TranslationView(translations: getTranslations(sense: sense))
                NoteView(notes: getNotes(sense: sense))
            }
        }
    }
    
    private func getTranslations(sense: Sense?) -> [Translation] {
        guard let translations = sense?.translations else { return [] }
        return translations
    }
    
    private func getNotes(sense: Sense?) -> [Note] {
        guard let notes = sense?.notes else { return [] }
        return notes
    }
}

struct SenseView_Previews: PreviewProvider {
    static var previews: some View {
        SenseView(senses: (Word.getWord().results.first?.lexicalEntries.first?.entries?.first?.senses)!)
    }
}
