//
//  IAPlayerView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/02/2023.
//

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
import Darwin

struct IAPlayerView: View {
    //----------------------------------
    //Variables
    

    @ObservedObject var sharedState: SharedParameters
    @State var currentPlayer : String
    
    @State var Current_color : Color
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
    @State private var showIAPopUp = false
    @State private var Win_Text = ""
    
    //----------------------------------
    //Init
    init(sharedState: SharedParameters) {
            self.sharedState = sharedState
            self._currentPlayer = State(initialValue: sharedState.iconP1)
        self._Current_color = State(initialValue: sharedState.C_P1)
        }

    func IA_Morpion() -> Bool {
        let result = checkWin()
        if result == false {
            var bestMove = [-1, -1]
            var bestScore = Int.min

            for i in 0..<3 {
                for j in 0..<3 {
                    if board[i][j] == "" {
                        board[i][j] = sharedState.iconP2
                        let score = minimax(depth: 0, isMaximizing: false)
                        board[i][j] = ""

                        if score > bestScore {
                            bestScore = score
                            bestMove = [i, j]
                        }
                    }
                }
            }

            if bestMove[0] != -1 && bestMove[1] != -1 {
                board[bestMove[0]][bestMove[1]] = sharedState.iconP2
                return true
            }
        }
        return false
    }

    //----------------------------------
    //Functions
    func minimax( depth: Int, isMaximizing: Bool) -> Int {
        let result = checkWin()
        
        if result == true {
            return 10 - depth
        } else if result == false {
            return -10 + depth
        } else {
            if isMaximizing {
                var bestScore = Int.min
                for i in 0..<9 {
                    if board[i/3][i%3] == "" {
                        let row = i/3
                        let col = i%3
                        board[row][col] = sharedState.iconP2
                        
                        let score = minimax(depth: depth + 1, isMaximizing: false)
                        board[row][col] = ""
                        bestScore = max(score, bestScore)
                    }
                }
                return bestScore
            } else {
                var bestScore = Int.max
                for i in 0..<9 {
                    if board[i/3][i%3] == "" {
                        let row = i/3
                        let col = i%3
                        board[row][col] = sharedState.iconP2
                        
                        let score = minimax( depth: depth + 1, isMaximizing: true)
                        board[row][col] = ""
                        bestScore = min(score, bestScore)
                    }
                }
                return bestScore
            }
        }
    }

    
    func checkWin() -> Bool {
            // Vérifier les lignes
            for row in 0...2 {
                if board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0] != "" {
                    if(board[row][0] == sharedState.iconP1){
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
                    if(board[0][col] == sharedState.iconP1){
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
                if(board[0][0] == sharedState.iconP1){
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
                if(board[0][2] == sharedState.iconP1){
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
    func coloringBoard() {
        for col in 0...2 {
            for row in 0...2 {
                if (board[row][col] == sharedState.iconP2 ){
                    color_b [row][col] = sharedState.C_P2
                }
                else if ( board[row][col] == sharedState.iconP1){
                    color_b [row][col] = sharedState.C_P1
                }
            }
        }
    }
    
    func resetBoard() {
        board = [["", "", ""],
                 ["", "", ""],
                 ["", "", ""]]
        
        if(ScoreP1>ScoreP2){
            Current_color = sharedState.C_P2
            currentPlayer = sharedState.iconP2
        }
            else{
                Current_color = sharedState.C_P1
                currentPlayer = sharedState.iconP1
            }
        
    }
    func round_game () {
        print(currentPlayer)
    
        if(currentPlayer==sharedState.iconP1){
            //IA
            IA_Morpion()
            coloringBoard()
            showIAPopUp = checkWin()
            
            Win_Text = "Player 2 WON"
            Current_color = sharedState.C_P2
        }
        
        else if (currentPlayer == sharedState.iconP2){
            //1P
            
            currentPlayer = sharedState.iconP1
            Win_Text = "Player 1 WON"
            Current_color = sharedState.C_P1
            
        }
        
    }
    
    //----------------------------------
    //View
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
                    Image(systemName: sharedState.iconP1)
                        .foregroundColor(sharedState.C_P1)
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
                    Image(systemName: sharedState.iconP2)
                        .foregroundColor(sharedState.C_P2)
                        .font(.largeTitle)
                    Text("CPU")
                    
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
        .onAppear{resetBoard()}
    }
    
}

struct IAPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        IAPlayerView(sharedState: SharedParameters())
    }
}

