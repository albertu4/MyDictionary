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
        ForEach(senses) { sense in
            ForEach(sense.definitions ?? [], id: \.self) { definition in
                Text(definition)
            }
        }
    }
}

extension SenseView {
    
    private func getTranslations(sense: Sense?) -> [Translation] {
        guard let translations = sense?.translations else { return [] }
        return translations
    }
    
    private func getExamples(sense: Sense) -> [Example] {
        guard let examples = sense.examples else { return [] }
        return examples
    }
}

struct SenseView_Previews: PreviewProvider {
    static var previews: some View {
        SenseView(senses: [])
    }
}
