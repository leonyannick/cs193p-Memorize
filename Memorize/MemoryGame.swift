//
//  MemoryGame.swift
//  Memorize
//
//  Created by Leon Baumann on 26.03.25.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex)a", content: content))
            cards.append(Card(id: "\(pairIndex)b", content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        
    }
    
    struct Card: Identifiable {
        var id: String
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}

