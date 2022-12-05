//
//  PlayButtonView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct PlayButtonView: View {
    let sound: String
    let transcription: String
    let englishKind: String
    
    var body: some View {
        HStack {
            PlayerView(sound: sound)
            Text("/ \(transcription) / ")
                .font(.headline)
            Text(englishKind)
        }
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(sound: "", transcription: "saksess", englishKind: "American Enlgish")
    }
}
