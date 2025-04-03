//
//  MemoryGame.swift
//  Memorize
//
//  Created by Leon Baumann on 26.03.25.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var score: Int = 0
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex)a", content: content))
            cards.append(Card(id: "\(pairIndex)b", content: content))
        }
        cards = cards.shuffled()
    }

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            cards.indices.forEach { index in
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isMatched && !cards[chosenIndex].isFaceUp {
                if let indexOfOneAndOnlyFaceUpCard {
                    if (cards[chosenIndex].content == cards[indexOfOneAndOnlyFaceUpCard].content) {
                        cards[chosenIndex].isMatched = true
                        cards[indexOfOneAndOnlyFaceUpCard].isMatched = true
                        score += 2
                    } else {
                        if cards[chosenIndex].hasBeenSeen { score -= 1 }
                        if cards[indexOfOneAndOnlyFaceUpCard].hasBeenSeen { score -= 1 }
                    }
                    cards[chosenIndex].hasBeenSeen = true
                    cards[indexOfOneAndOnlyFaceUpCard].hasBeenSeen = true
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var id: String
        var isFaceUp = false
        var isMatched = false
        var hasBeenSeen = false
        let content: CardContent
        
        var debugDescription: String {
                "\(id), \(content), \(isFaceUp ? "up" : "down"), \(isMatched ? "matched" : "not matched")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}

