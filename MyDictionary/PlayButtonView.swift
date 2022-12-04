//
//  PlayButtonView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI

struct PlayButtonView: View {
    let sound: String
    let text: String
    
    var body: some View {
        VStack(spacing: 10) {
            PlayerView(sound: sound)
            Text(text)
        }
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(sound: "", text: "American english")
    }
}
