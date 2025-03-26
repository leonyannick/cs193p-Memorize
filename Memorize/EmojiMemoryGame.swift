//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leon Baumann on 26.03.25.
//

import SwiftUI

func emojiCardContentFactory(_ index: Int) -> String {
    let greenTheme = ["🤢", "🐉", "🐍", "🍀", "🦖", "💚"]
    if (index >= 0 && index < greenTheme.count) { return greenTheme[index] }
    else { return "‼" }
}

class EmojiMemoryGame: ObservableObject {
    @Published private var game = MemoryGame<String>(numberOfPairs: 8, cardContentFactory: emojiCardContentFactory)
    
    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
