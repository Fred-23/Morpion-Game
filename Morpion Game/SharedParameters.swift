//
//  SharedParameters.swift
//  Morpion Game
//
//  Created by Frédéric ALPHONSE on 05/02/2023.
//
import SwiftUI
import Foundation
class SharedParameters: ObservableObject {
    @Published var iconP1 = "circle"
    @Published var iconP2 = "square"
    @Published var C_P1 = Color.blue
    @Published var C_P2 = Color.red

}
