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
    @ObservedObject var backgroundMusic = BackgroundMusic()
    let sharedState = SharedParameters()

   
    var body: some View {
        //self.backgroundMusic.play()
        return NavigationView {
            List {
                NavigationLink(destination: ContentView()) {
                    Text("One player")
                    Image(systemName:"tray.fill")
                }
                NavigationLink(destination: TwoPlayerView(sharedState: sharedState).environmentObject(sharedState)) {
                    Text("Two player")
                    Image(systemName:"tray.2.fill")
                }
                NavigationLink(destination: SettingsView(sharedState: sharedState).environmentObject(sharedState)) {
                    Text("Settings")
                    Image(systemName:"gearshape.fill")
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

