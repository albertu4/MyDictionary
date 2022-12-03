//
//  PlayerView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    let sound: String
    @State private var song1 = false
    @StateObject private var soundManager = SoundManager()
    
    var body: some View {
        Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
            .font(.system(size: 25))
            .padding(.trailing)
            .onTapGesture {
                soundManager.playSound(sound: sound)
                song1.toggle()
                
                if song1{
                    soundManager.audioPlayer?.play()
                } else {
                    soundManager.audioPlayer?.pause()
                }
            }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(sound: "mp3")
    }
}

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?
    
    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
