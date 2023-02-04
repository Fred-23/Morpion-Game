//
//  MusicView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 04/02/2023.
//
import SwiftUI
import AVFoundation

struct MusicView: View {
    @State var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isPlaying.toggle()
                if self.isPlaying {
                    self.playBackgroundMusic()
                } else {
                    self.pauseBackgroundMusic()
                }
            }) {
                Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
            }
        }
    }
    
    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func pauseBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            let player = try AVAudioPlayer(contentsOf: url)
            player.pause()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
