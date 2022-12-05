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
            
            Spacer()
            
            if englishKind == "American English" {
//                Text("🇺🇸")
//                    .font(.largeTitle)
//                ZStack {
//                    RoundedRectangle(cornerRadius: 5)
//                        .frame(width: 30, height: 30)
//
//                    Text("US")
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                }
                Image(englishKind)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
                    .shadow(color: .blue, radius: 5)
            } else {
                Image(englishKind)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
                    .shadow(color: .red, radius: 5)
//                Text("🇬🇧")
//                    .font(.largeTitle)
//                ZStack {
//                    RoundedRectangle(cornerRadius: 5)
//                        .frame(width: 30, height: 30)
//
//                    Text("GB")
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                }
                
            }
        }
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(sound: "", transcription: "saksess", englishKind: "American Enlgish")
    }
}
