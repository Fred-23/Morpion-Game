//
//  MusicView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 04/02/2023.
//
import SwiftUI
import AVKit

struct MusicView: View {
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isPlaying.toggle()
                if self.isPlaying {
                    MusicPlayer.shared.play(fileName: "music", fileExtension: "mp3")
                } else {
                    MusicPlayer.shared.pause()
                }
            }) {
                Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
            }
        }
    }
}

class MusicPlayer {
    static let shared = MusicPlayer()
    
    private var player = AVPlayer()
    
    func play(fileName: String, fileExtension: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player.volume = 1.0
            player.play()
        }
    }
    
    func pause() {
        player.pause()
    }
    
    func resume() {
        player.play()
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
