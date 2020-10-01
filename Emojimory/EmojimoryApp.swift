//
//  EmojimoryApp.swift
//  Emojimory
//
//  Created by Florian Thiévent on 17.09.20.
//

import SwiftUI

@main
struct EmojimoryApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
        }
    }
}
