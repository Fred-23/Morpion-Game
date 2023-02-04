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
    @State var firstPlayer = "circle"
    @State var secondPlayer = "square"
    
    
    @State var P1_color = Color.blue
    @State var P2_color = Color.red
    @State var Current_color = Color.blue
    @State var board = [[String]](repeating: [String](repeating: "", count: 3), count: 3)
    @State var color_b = [[Color.blue, Color.blue, Color.blue],
             [Color.blue, Color.blue, Color.blue],
             [Color.blue,Color.blue, Color.blue]]

    @State var opacity = 0.8
    @State var counter = 0
    @State private var showPopUp = false
    //Score for players
    @State private var ScoreP1 = 0
    @State private var ScoreP2 = 0
    
    @State private var Win_Text = ""

    func checkWin() -> Bool {
            // Vérifier les lignes
            for row in 0...2 {
                if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != "" {
                    if(board[row][0] == firstPlayer){
                        ScoreP1 += 1
                        print("P1");
                    }
                    else{
                        ScoreP2 += 1
                        print("P1");
                    }
                    print("WIN ?");
                    resetBoard()
                    return true
                }
            }
            // Vérifier les colonnes
            for col in 0...2 {
                if board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[0][col] != "" {
                    if(board[0][col] == firstPlayer){
                        ScoreP1 += 1
                        print("P1");
                    }
                    else{
                        ScoreP2 += 1
                        
                    }
                    print("WIN ?");
                    resetBoard()
                    return true
                }
            }
            
            // Vérifier les diagonales
            if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "" {
                if(board[0][0] == firstPlayer){
                    ScoreP1 += 1
                    print("P1");
                }
                else{
                    ScoreP2 += 1
                }
                print("WIN ?");
                resetBoard()
                return true
            }
            if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "" {
                if(board[0][2] == firstPlayer){
                    ScoreP1 += 1
                    print("P1");
                }
                else{
                    ScoreP2 += 1
                    
                }
                print("WIN ?");
                resetBoard()
                return true
            }
            
            return false
            
        }
    func resetBoard() {
        board = [["", "", ""],
                 ["", "", ""],
                 ["", "", ""]]
        
        if(currentPlayer=="circle"){
            Current_color = P1_color
        }
            else{
                Current_color = P2_color
            }
        
    }
    func round_game () {
            print(currentPlayer)
    /*switch counter {
        case 0:
            currentPlayer = "square"
            opacity = 0.8
            counter += 1
    
        case 1:
            currentPlayer = firstPlayer
            opacity = 0.8
            counter += 1
        default:
            opacity = 0.8
            counter = 0
        }*/
        if(currentPlayer==firstPlayer){
            //2P
            currentPlayer = secondPlayer
            Win_Text = "Player 1 WON"
            Current_color = P2_color
        }
        
        else{
            //1P
            currentPlayer = firstPlayer
            Win_Text = "Player 2 WON"
            Current_color = P1_color
        }
        
    }
    
    
    var body: some View {
        
        VStack (){
            
            Button{
                resetBoard()
            }label: {
                Text("Morpion")
                Image(systemName: "arrow.clockwise.circle")
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
                                color_b[0][0] = Current_color
                               
                            }
                            
                                
                            round_game ()
                            showPopUp=checkWin()
                            
                            //object = circle_sf
                        } label: {
                            Image(systemName:board[0][0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[0][0])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                               
                        }
                        
                        Spacer()
                        Button {
                            print("A2")
                            if(board[0][1]==""){
                                 board[0][1] = currentPlayer
                                 color_b[0][1] = Current_color
                             }
                           
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[0][1])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[0][1])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        Spacer()
                        Button {
                            print("A3")
                            if(board[0][2]=="" ){
                                board[0][2] = currentPlayer
                                color_b[0][2] = Current_color
                        }
                            
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[0][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[0][2])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        
                        Spacer()
                    }
                    
                    
                    Spacer()
                        .frame(width: 90.0)
                        
                    
                    VStack() {
                        Button {
                            print("B1")
                            //Block one time
                            if(board[1][0]=="" ){
                                board[1][0] = currentPlayer
                                color_b[1][0] = Current_color
                        }
                            showPopUp=checkWin()
                            round_game()
                            
                        } label: {
                            Image(systemName:board[1][0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[1][0])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        Spacer()
                        Button {
                            print("B2")
                            if(board[1][1]=="" ){
                                board[1][1] = currentPlayer
                                color_b[1][1] = Current_color
                        }
                           
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[1][1] )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[1][1] )
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        Spacer()
                        Button {
                            print("B3")
                            if(board[1][2]=="" ){
                                board[1][2] = currentPlayer
                                color_b[1][2] = Current_color
                        }
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[1][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[1][2])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
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
                                color_b[2][0] = Current_color
                        }
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[2][0] )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[2][0] )
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(currentPlayer)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        Spacer()
                        Button {
                            print("C2")
                            if(board[2][1]=="" ){
                                board[2][1] = currentPlayer
                                color_b[2][1] = Current_color
                        }
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[2][1])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor( color_b[2][1])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                     Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                   }
                        }
                        Spacer()
                        Button {
                            print("C3")
                            if(board[2][2]=="" ){
                                board[2][2] = currentPlayer
                                color_b[2][2] = Current_color
                        }
                            showPopUp=checkWin()
                            round_game()
                        } label: {
                            Image(systemName:board[2][2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(color_b[2][2])
                                .frame(width: 50.0, height: 50.0)
                                .opacity(opacity)
                                .sheet(isPresented: $showPopUp) {
                                    Text(Win_Text)
                                        .controlSize(/*@START_MENU_TOKEN@*/.regular/*@END_MENU_TOKEN@*/)
                                        .font(.largeTitle)
                                       
                                   }
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
                    Image(systemName: firstPlayer)
                        .foregroundColor(P1_color)
                        .font(.largeTitle)
                    Text("P1")
        
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(String(ScoreP1))
                        .font(.largeTitle)
                    
                    Spacer()
                }
                Spacer()
                VStack {
                    Image(systemName: secondPlayer)
                        .foregroundColor(P2_color)
                        .font(.largeTitle)
                    Text("P2")
                    
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(String(ScoreP2))
                        .font(.largeTitle)
                    
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

