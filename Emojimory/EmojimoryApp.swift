//
//  EmojimoryApp.swift
//  Emojimory
//
//  Created by Florian Thiévent on 17.09.20.
//

import SwiftUI

@main
struct EmojimoryApp: App {
    @State var gameStarted: Bool = false
    var body: some Scene {
        WindowGroup {
            if gameStarted{
                MemoryGameView(viewModel: MemoryGameViewModel())
            }
            MemoryGameStartView(gameStarted: $gameStarted)
        }
    }
}
