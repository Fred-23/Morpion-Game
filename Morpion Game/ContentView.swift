//
//  ContentView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/12/2022.
//

import SwiftUI

struct ContentView: View {
    var square_sf = "square.circle.fill"
    var circle_sf = "circle.circle.fill"
    var blank_sf = "pencil"
    @State var object = "pencil"
    @State var counter = 0
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
                .padding(15.0)
            Spacer()
            ZStack {
                HStack{
                    
                    
                    VStack() {
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                    }
                    
                    
                    Spacer()
                        .frame(width: 90.0)
                        
                    
                    VStack(alignment: .leading){
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                    }
                    Spacer()
                        .frame(width: 90.0)
                    
                    VStack {
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                        Image(systemName:object)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                        Spacer()
                    }
                    
                    
                }
                .padding(.top, 60.0)
                .frame(width: 350.0, height: 400.0)
                Image("Grid Morpion")
                    .resizable()
                    //.padding(.bottom, 30.0)
                    .frame(width: 350.0, height: 400.0)
                
                
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
