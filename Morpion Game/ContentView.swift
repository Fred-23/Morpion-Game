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

    struct ContentView: View {
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
    

        func IA_Morpion() -> Bool {
            let result = checkWin()
            if result == false {
                var bestMove = [-1, -1]
                var bestScore = Int.min

                for i in 0..<3 {
                    for j in 0..<3 {
                        if board[i][j] == "" {
                            board[i][j] = secondPlayer
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
                    board[bestMove[0]][bestMove[1]] = secondPlayer
                    return true
                }
            }
            return false
        }

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
                            board[row][col] = secondPlayer
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
                            board[row][col] = "circle"
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
        
            if(currentPlayer==firstPlayer){
                //2P
                //Add IA turn just here
                Current_color = P2_color
                IA_Morpion()
                Win_Text = "Player 1 WON"
                
            }
            
            else{
                //1P
                
                currentPlayer = firstPlayer
                Win_Text = "CPU WON"
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
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

