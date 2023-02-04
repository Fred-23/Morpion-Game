//
//  MenuView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 11/12/2022.
//
import SwiftUI
import Foundation
import AVFoundation

struct MenuView: View {
    let backgroundMusic = BackgroundMusic()

    class BackgroundMusic {
        var player: AVAudioPlayer?
        
        func play() {
            guard let url = Bundle.main.url(forResource: "music", withExtension: "mp3") else { return }
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.prepareToPlay()
                player?.play()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func pause() {
            player?.pause()
        }
    }

    var body: some View {
        backgroundMusic.play()
        return NavigationView {
            List {
                NavigationLink(destination: ContentView()) {
                    Text("One player")
                    Image(systemName:"tray.fill")
                }
                NavigationLink(destination: TwoPlayerView()) {
                    Text("Two player")
                    Image(systemName:"tray.2.fill")
                }
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                    Image(systemName:"gearshape.fill")
                }
                NavigationLink(destination: MusicView()) {
                    Text("Music")
                    Image(systemName:"music.note")
                }
            }
            .navigationBarTitle(Text("Menu"))
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

