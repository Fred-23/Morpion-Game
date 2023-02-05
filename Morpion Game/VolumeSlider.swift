//
//  VolumeSlider.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 04/02/2023.
//

// VolumeSlider.swift
import SwiftUI

struct VolumeSlider: View {
    @ObservedObject var backgroundMusic: BackgroundMusic
    
    var body: some View {
        HStack {
            Image(systemName: "speaker.fill")
            Slider(value: $backgroundMusic.volume, in: 0...1)
            Image(systemName: "speaker.3.fill")
        }
    }
}
    

struct VolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider(backgroundMusic: BackgroundMusic())
    }
}

