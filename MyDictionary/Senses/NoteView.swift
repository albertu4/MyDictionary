//
//  NoteView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct NoteView: View {
    let notes: [Note]
    
    var body: some View {
        ForEach(notes, id: \.text) { note in
            Text(note.text)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(notes: (Word.getWord().results.first?.lexicalEntries.first?.entries?.first?.senses.first?.notes)!)
    }
}
