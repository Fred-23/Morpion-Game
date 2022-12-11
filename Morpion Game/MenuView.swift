//
//  MenuView.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 11/12/2022.
//

import SwiftUI

struct MenuView: View {
    //Put a back button
    @State var showContentView: Bool = false

    var body: some View {
       
                
        VStack {
            Text("Morpion Game by Fred")
            Spacer()
            NavigationView {
                        //Jump to another view or fix some parameters and use the same view (best option)
                        List {
                            NavigationLink(destination: ContentView()) {
                                Text("One player")
                                Image(systemName:"tray.fill")
                                //print("One Player")
                            }
                            NavigationLink(destination: ContentView()) {
                                Text("Two player")
                                Image(systemName:"tray.2.fill")
                                //print("Two Player")
                            }
                            NavigationLink(destination: ContentView()) {
                                Text("Settings")
                                Image(systemName:"gearshape.fill")
                                //print("Settings")
                            }
                        }
                        .navigationBarTitle(Text("Menu"))
                    }
            
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
