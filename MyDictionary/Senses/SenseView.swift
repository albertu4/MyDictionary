//
//  SenseView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct SenseView: View {
    let senses: [Sense]
    let isExample: Bool
    
    var body: some View {
        ForEach(senses, id: \.id) { sense in
            
            if isExample {
                ExampleView(examples: getExamples(sense: sense))
            } else {
                TranslationView(translations: getTranslations(sense: sense))
            }
        }
    }
}

extension SenseView {
    
    private func getTranslations(sense: Sense?) -> [Translation] {
        guard let translations = sense?.translations else { return [] }
        return translations
    }
    
//    private func getNotes(sense: Sense?) -> [Note] {
//        guard let notes = sense?.notes else { return [] }
//        return notes
//    }
    
    private func getExamples(sense: Sense) -> [Example] {
        guard let examples = sense.examples else { return [] }
        return examples
    }
}

struct SenseView_Previews: PreviewProvider {
    static var previews: some View {
        SenseView(senses: (Word.getWord().results.first?.lexicalEntries?.first?.entries?.first?.senses)!, isExample: true)
    }
}
