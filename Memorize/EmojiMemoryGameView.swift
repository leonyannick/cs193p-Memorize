//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI



struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    let purpleTheme = ["😈", "🍆", "💜", "👾", "🔮"]
    let greenTheme = ["🤢", "🐉", "🐍", "🍀", "🦖", "💚"]
    let blueTheme = ["🧿", "💙", "🔵", "🌊", "💤", "🌀"]
    
    var body: some View {
        VStack {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(emojiGame.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            emojiGame.choose(card)
                            print(card)
                        }
                }
                .padding()
               
            }
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    let cardColor = Color.blue
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .stroke(cardColor, lineWidth: 3)
            Text(card.content).font(.largeTitle)
            Circle()
                .fill(cardColor)
                .opacity(card.isFaceUp ? 0 : 1)
                
        }
            .opacity(card.isMatched ? 0 : 1)
    }
}










#Preview {
    EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
}
