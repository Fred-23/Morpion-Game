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
    @State private var iconP1 = "circle"
    @State private var iconP2 = "square"
    @State private var isP1 = false
    @State private var isP2 = false
    @State private var C_P1 = Color.blue
    @State private var C_P2 = Color.red
    var body: some View {
        
        NavigationView{
            
            List() {
                
                    VolumeSlider()
                
                    Button(action: {
                        withAnimation {
                            isP1.toggle()
                        }
                    }, label: {
                        HStack {
                            Text("Icon P1")
                            Spacer()
                            Image(systemName: iconP1).font(.title3)
                        }
                    })
                    
                SFSymbolsPicker(isPresented: $isP1, icon: $iconP1, category: .forms, axis: .vertical, haptic: true)
                
                Button(action: {
                    withAnimation {
                        isP2.toggle()
                    }
                }, label: {
                    HStack {
                        Text("Icon P2")
                        Spacer()
                        Image(systemName: iconP2).font(.title3)
                    }
                })
                
            SFSymbolsPicker(isPresented: $isP2, icon: $iconP2, category: .forms, axis: .vertical, haptic: true)
                        
                
//                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Icon P1")) {
//                    Image(systemName:"circle").tag(1)
//                    Image(systemName:"car.rear").tag(2)
//                    Image(systemName:"figure.mixed.cardio").tag(3)
//                    Image(systemName:"paperclip").tag(4)
//                    Image(systemName:"person.fill").tag(5)
//                    Image(systemName:"dumbbell").tag(6)
//                    Image(systemName:"hand.thumbsup.fill").tag(7)
//                    Image(systemName:"square").tag(8)
//
//                }
//                .foregroundColor(Color.blue)
//
//                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Icon P2")) {
//                    Image(systemName:"circle").tag(1)
//                    Image(systemName:"car.rear").tag(2)
//                    Image(systemName:"figure.mixed.cardio").tag(3)
//                    Image(systemName:"paperclip").tag(4)
//                    Image(systemName:"person.fill").tag(5)
//                    Image(systemName:"dumbbell").tag(6)
//                    Image(systemName:"hand.thumbsup.fill").tag(7)
//                    Image(systemName:"square").tag(8)
//                }
//                .foregroundColor(Color.blue)
                
                
                ColorPicker("Color Player 1 ", selection: .constant(.blue))
                    .foregroundColor(Color.blue)
                
                ColorPicker("Color Player 2 ", selection: .constant(.red))
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
        SettingsView()
    }
}
