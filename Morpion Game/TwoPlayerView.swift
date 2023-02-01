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
    
    //Score for players
    @State private var ScoreP1 = 0
    @State private var ScoreP2 = 0

    func checkWin() -> Bool {
            // Vérifier les lignes
            for row in 0...2 {
                if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != "" {
                    if(board[row][0] == "circle"){
                        ScoreP1 += 1
                        print("P1");
                    }
                    else{
                        ScoreP2 += 1
                        print("P1");
                    }
                    print("WIN ?");
                    return true
                }
            }
            
            // Vérifier les colonnes
            for col in 0...2 {
                if board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[0][col] != "" {
                    if(board[0][col] == "circle"){
                        ScoreP1 += 1
                        print("P1");
                    }
                    else{
                        ScoreP2 += 1
                        
                    }
                    print("WIN ?");
                    return true
                }
            }
            
            // Vérifier les diagonales
            if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "" {
                if(board[0][0] == "circle"){
                    ScoreP1 += 1
                    print("P1");
                }
                else{
                    ScoreP2 += 1
                    
                }
                print("WIN ?");
                return true
            }
            if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "" {
                if(board[0][2] == "circle"){
                    ScoreP1 += 1
                    print("P1");
                }
                else{
                    ScoreP2 += 1
                    
                }
                print("WIN ?");
                return true
            }
            
            return false
            
        }

    func resetBoard() {
      board = [["", "", ""],
               ["", "", ""],
               ["", "", ""]]
      currentPlayer = "circle"
    }
    func round_game () {
            print(currentPlayer)
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
                resetBoard()
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
                            
                           if(board[0][0]==""){
                                board[0][0] = currentPlayer
                            }
                                
                            round_game ()
                            checkWin()
                                
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
                            if(board[0][1]==""){
                                 board[0][1] = currentPlayer
                             }
                            checkWin()
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
                            if(board[0][2]=="" ){
                                board[0][2] = currentPlayer
                        }
                            checkWin()
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
                            if(board[1][0]=="" ){
                                board[1][0] = currentPlayer
                        }
                            checkWin()
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
                            if(board[1][1]=="" ){
                                board[1][1] = currentPlayer
                        }
                            checkWin()
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
                            if(board[1][2]=="" ){
                                board[1][2] = currentPlayer
                        }
                            checkWin()
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
                            if(board[2][0]=="" ){
                                board[2][0] = currentPlayer
                        }
                            checkWin()
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
                            if(board[2][1]=="" ){
                                board[2][1] = currentPlayer
                        }
                            checkWin()
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
                            if(board[2][2]=="" ){
                                board[2][2] = currentPlayer
                        }
                            checkWin()
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
                    Text(String(ScoreP1))
                        .font(.title)
                    
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("Player2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(String(ScoreP2))
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

