//
//  TranslationView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct TranslationView: View {
    let translations: [Translation?]
    
    var body: some View {
        ForEach(translations, id: \.self) { translation in
            Text(translation?.text ?? "")
        }
    }
}

struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView(translations: (Word.getWord().results.first?.lexicalEntries?.first?.entries?.first?.senses?.first?.translations)!)
    }
}
