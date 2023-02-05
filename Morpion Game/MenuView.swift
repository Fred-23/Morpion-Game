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
    let sharedState = SharedParameters()

   
    var body: some View {
        backgroundMusic.play()
        return NavigationView {
            VStack {
                VStack {
                    List {
                        NavigationLink(destination: IAPlayerView(sharedState: sharedState).environmentObject(sharedState)) {
                            Text("One player")
                            Image(systemName:"tray.fill")
                        }
                        NavigationLink(destination: TwoPlayerView(sharedState: sharedState).environmentObject(sharedState)) {
                            Text("Two player")
                            Image(systemName:"tray.2.fill")
                        }
                        NavigationLink(destination: SettingsView(sharedState: sharedState,backgroundMusic:backgroundMusic).environmentObject(sharedState).environmentObject(backgroundMusic)) {
                            Text("Settings")
                            Image(systemName:"gearshape.fill")
                        }
                    }
                    .navigationBarTitle(Text("Menu"))
                }
                VStack {
                    Text("Created by Frederic.A @2023")
                }
            }
            
        }
        
    }
    
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

