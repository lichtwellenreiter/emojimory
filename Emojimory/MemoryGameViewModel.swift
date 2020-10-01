//
//  MemoryGameViewModel.swift
//  Emojimory
//
//  Created by Florian Thiévent on 24.09.20.
//

import Foundation

class MemoryGameViewModel: ObservableObject{
    
    init() {
        model = MemoryGameViewModel.createMemoryGame()
    }
    
    @Published private var model: MemoryGameModel<String>
    
    static func createMemoryGame()->MemoryGameModel<String>{
        let emojiis: Array<String> = ["🐰","🦊", "🐻"]
        return  MemoryGameModel<String>(numberOfPairsOfCards: emojiis.count, cardContentFactory: { pairIndex in
            return emojiis[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGameModel<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
    
}
