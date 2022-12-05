//
//  CategorySentence.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct CategorySentence: View {
    let sentences: [Sentence]
    
    var body: some View {
        ForEach(sentences, id: \.self) { sentence in
            Text(sentence.text)
        }
    }
}

struct CategorySentence_Previews: PreviewProvider {
    static var previews: some View {
        CategorySentence(sentences: (Word.getWord().results.first?.lexicalEntries?.first?.sentences)!)
    }
}
