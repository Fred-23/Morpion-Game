//
//  BackgroundMusic.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/02/2023.
//
import AVFoundation

class BackgroundMusic : ObservableObject {
    var player: AVAudioPlayer?
    @Published var volume: Float = 0.5
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
