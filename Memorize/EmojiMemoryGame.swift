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

class EmojiMemoryGame {
    private var game = MemoryGame<String>(numberOfPairs: 6, cardContentFactory: emojiCardContentFactory)
    
    var cards: [MemoryGame<String>.Card] {
        return game.cards
    }
}
