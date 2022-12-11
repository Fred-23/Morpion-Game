//
//  ContentView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/12/2022.
//

import SwiftUI
//La couleur blanche ne marche pas avec le mode sombre
struct ContentView: View {
    var square_sf = "square.circle.fill"
    var circle_sf = "circle.circle.fill"
    var blank_sf = "pencil"
    @State var object = "pencil"
    @State var counter = 0
    func morpion () {
        
            //Tableau deux dimensions ou matrice carré 3
            print("Debug")
            //On accès à la variable
            //code to send the chatt
        }
    
    var body: some View {
        VStack (){
            Button("Morpion") {
                switch counter {
                case 0:
                    object = square_sf
                    counter += 1
                case 1:
                    object = circle_sf
                    counter += 1
                case 2:
                    object = blank_sf
                    counter += 1
                default:
                    object = blank_sf
                    counter = 0
                }
            }
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.blue)
            Spacer()
            ZStack {
                HStack{
                    
                    VStack() {

                        Button {
                            print("A1")
                            //object = circle_sf
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.foregroundColor(Color.white)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("A2")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("A3")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                        Spacer()
                    }
                    
                    
                    Spacer()
                        .frame(width: 90.0)
                        
                    
                    VStack() {
                        Button {
                            print("B1")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("B2")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("B3")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 90.0)
                    
                    VStack() {
                        Button {
                            print("C1")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("C2")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        Spacer()
                        Button {
                            print("C3")
                        } label: {
                            Image(systemName:object)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                        Spacer()
                    }
                    
                    
                }
                .zIndex(1)

                .padding(.top, 60.0)
                .frame(width: 350.0, height: 400.0)
                Image("Grid Morpion")
                    .resizable()
                    //.padding(.bottom, 30.0)
                    .frame(width: 350.0, height: 350.0)
                
                
            }
            .padding(.top)
           
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    
                    Text("Player")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("0")
                        .font(.title)
                    
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("CPU")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("0")
                        .font(.title)
                    Spacer()
                }
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
