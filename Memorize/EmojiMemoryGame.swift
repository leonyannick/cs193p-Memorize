//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leon Baumann on 26.03.25.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>
    private var theme: MemoryGameTheme
    
    init() {
        theme = MemoryGameTheme()
        game = EmojiMemoryGame.createMemoryGame(numberOfPairs: theme.numberOfPairs, cardContentFactory: theme.cardContentFactory)
    }
    
    static func createMemoryGame(numberOfPairs: Int, cardContentFactory: (Int) -> String) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairs: numberOfPairs, cardContentFactory: cardContentFactory)
    }
    
    var cards: [MemoryGame<String>.Card] { game.cards }
    
    var score: Int { game.score }
    
    var themeColor: Color {
        let colorMap: [String: Color] = [
            "red": .red,
            "orange": .orange,
            "yellow": .yellow,
            "green": .green,
            "blue": .blue,
            "purple": .purple,
            "pink": .pink,
            "brown": .brown,
            "black": .black,
            "white": .white,
            "gray": .gray,
            "teal": .teal,
            "cyan": .cyan,
            "mint": .mint,
            "indigo": .indigo
        ]
        
        return colorMap[theme.color] ?? .gray
    }
    
    var themeName: String { theme.name }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    func newGame() {
        theme = MemoryGameTheme()
        game = EmojiMemoryGame.createMemoryGame(numberOfPairs: theme.numberOfPairs, cardContentFactory: theme.cardContentFactory)
    }
}
