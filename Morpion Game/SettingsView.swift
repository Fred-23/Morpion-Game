//
//  SettingsView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 04/02/2023.
//

import SwiftUI
import SFSymbolsPicker


struct SettingsView: View {
    //Local variable but will be later link to the other varibles of other views
    //@State var iconP1 = "circle"
    @ObservedObject var sharedState: SharedParameters
    @ObservedObject var backgroundMusic = BackgroundMusic()
    //@State public var iconP2 = "square"
    @State private var isP1 = false
    @State private var isP2 = false
    //@State private var C_P1 = Color.blue
    //@State private var C_P2 = Color.red
    @State var volume: Float = 0.5
    @State var isPlaying: Bool = true
    
    var body: some View {
        

        NavigationView{
            
            List() {
                
                Button(action: {
                    self.isPlaying.toggle()
                    if self.isPlaying {
                        self.backgroundMusic.play()
                    } else {
                        self.backgroundMusic.pause()
                    }
                }) {
                    HStack{
                        
                        VStack {
                            Text("Background Music")
                        }
                        VStack {
                            Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
                        }
                    }
                
            }
                
                    Button(action: {
                        withAnimation {
                            isP1.toggle()
                         
                        }
                    }, label: {
                        HStack {
                            Text("Icon P1")
                            Spacer()
                            Image(systemName: sharedState.iconP1).font(.title3)
                                .foregroundColor(sharedState.C_P1)
                        }
                        
                    })
                    
                SFSymbolsPicker(isPresented: $isP1, icon: $sharedState.iconP1, category: .forms, axis: .vertical, haptic: true)
                
                Button(action: {
                    withAnimation {
                        isP2.toggle()
                    }
                }, label: {
                    HStack {
                        Text("Icon P2")
                        Spacer()
                        Image(systemName: sharedState.iconP2).font(.title3)
                            .foregroundColor(sharedState.C_P2)
                    }
                    
                })
                
            SFSymbolsPicker(isPresented: $isP2, icon: $sharedState.iconP2, category: .forms, axis: .vertical, haptic: true)
                        
                
                
                ColorPicker("Color Player 1 ", selection: $sharedState.C_P1)
                    .foregroundColor(Color.blue)
                
                ColorPicker("Color Player 2 ", selection: $sharedState.C_P2)
                    .foregroundColor(Color.blue)
                Button(action: {
                            guard let url = URL(string: "https://github.com/Fred-23") else { return }
                            UIApplication.shared.open(url)
                        }) {
                            Text("My Personal Website")
                                .multilineTextAlignment(.center)
                                .padding(.leading, 81.0)
                                
                                
                        }
            }
            
        }.environment(\.defaultMinListRowHeight, 100)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sharedState: SharedParameters(),backgroundMusic: BackgroundMusic())
    }
}
