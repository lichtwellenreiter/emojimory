//
//  MemoryGameModel.swift
//  Emojimory
//
//  Created by Florian Thiévent on 24.09.20.
//

import Foundation

struct MemoryGameModel<CardContent>{
    
    var cards: Array<Card>

    mutating func choose(card: Card){
        print("card chosen: \(card)")
        
        let selectedCardIndex = index(of: card)
        cards[selectedCardIndex].isFaceUp = !card.isFaceUp
    }
    
    func index(of card: Card)-> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
