//
//  VolumeSlider.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 04/02/2023.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct VolumeSlider: View {
    @State var volume: Double = 0.5 {
        didSet {
            try? AVAudioSession.sharedInstance().setActive(true)
            try? AVAudioSession.sharedInstance().setCategory(.playback)
            try? AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try? AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            try? AVAudioSession.sharedInstance().setPreferredIOBufferDuration(5.0)
            let audioSession = AVAudioSession.sharedInstance()
            try? audioSession.setActive(true)
            try? audioSession.setPreferredSampleRate(44100.0)
            try? audioSession.setPreferredIOBufferDuration(0.005)
            let volume = self.volume
            let volumeView = MPVolumeView()
            let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
            slider?.value = Float(volume)
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "speaker.fill")
            Slider(value: $volume, in: 0...1)
            Image(systemName: "speaker.3.fill")
        }
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider()
    }
}
