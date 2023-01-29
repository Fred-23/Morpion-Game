//
//  TwoPlayerView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 30/01/2023.
//

//
//  ContentView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/12/2022.
//

import SwiftUI
//La couleur blanche ne marche pas avec le mode sombre

struct TwoPlayerView: View {
    var square_sf = "square.circle.fill"
    var circle_sf = "circle.circle.fill"
    var blank_sf = "circle"
    //@State var grid = [[String]](repeating: [String](repeating: "circle", count: 3), count: 3)
    //@State var check_board  = [[String]](repeating: [String](repeating: "", count: 3), count: 3)
    @State var currentPlayer = "circle"
    @State var board = [[String]](repeating: [String](repeating: "", count: 3), count: 3)

    @State var opacity = 0.8
    @State var counter = 0
    
    
    func round_game () {
            print("Counter")
    /*switch counter {
        case 0:
            currentPlayer = "square"
            opacity = 0.8
            counter += 1
    
        case 1:
            currentPlayer = "circle"
            opacity = 0.8
            counter += 1
        default:
            opacity = 0.8
            counter = 0
        }*/
        if(currentPlayer=="circle"){
            //2P
            currentPlayer = "square"
        }
        else{
            //1P
            currentPlayer = "circle"
        }
        
    }
    
    
    var body: some View {
        VStack (){
            
            Button("Morpion") {
               
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
                            
                            board[0][0] = currentPlayer
                            round_game ()
                            //object = circle_sf
                        } label: {
                            Image(systemName:board[0][0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.foregroundColor(Color.white)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("A2")
                            board[0][1] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[0][1])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("A3")
                            board[0][2] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[0][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        
                        Spacer()
                    }
                    
                    
                    Spacer()
                        .frame(width: 90.0)
                        
                    
                    VStack() {
                        Button {
                            print("B1")
                            //Bloquer un fois touche
                            board[1][0] = currentPlayer
                            round_game()
                            
                        } label: {
                            Image(systemName:board[1][0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("B2")
                            board[1][1] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[1][1] )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("B3")
                            board[1][2] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[1][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 90.0)
                    
                    VStack() {
                        Button {
                            print("C1")
                            board[2][0] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[2][0] )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("C2")
                            board[2][1] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[2][1])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                        }
                        Spacer()
                        Button {
                            print("C3")
                            board[2][2] = currentPlayer
                            round_game()
                        } label: {
                            Image(systemName:board[2][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.blue)
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
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
                    Text("Player2")
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

struct TwoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TwoPlayerView()
    }
}

