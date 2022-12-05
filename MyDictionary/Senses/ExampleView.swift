//
//  ExampleView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import SwiftUI

struct ExampleView: View {
    let examples: [Example?]
    
    var body: some View {
        ForEach(examples, id: \.self) { example in
            
            Text("- " + (example?.text ?? ""))
                .bold()
            TranslationView(translations: example?.translations ?? [])
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(examples: (Word.getWord().results.first?.lexicalEntries?.first?.entries?.first?.senses.first?.examples)!)
    }
}
