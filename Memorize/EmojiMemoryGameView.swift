//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                themeInfo
                Spacer()
                score
            }
            cards
            newGameButton
        }
        .padding()
    }
    
    var score: some View {
        Text("Score: \(emojiGame.score)")
            .foregroundColor(.black)
            .font(.title)
    }
    
    var themeInfo: some View {
        Text("Theme: \(emojiGame.themeName)")
            .foregroundColor(emojiGame.themeColor)
            .font(.title)
    }
    
    var newGameButton: some View {
        Button(action: {
            emojiGame.newGame()
        }, label: {
            HStack {
                Image(systemName: "shuffle")
                Text("new Game")
            }
                .foregroundColor(.black)
                .font(.title)
        })
            .buttonStyle(.bordered)
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 0) {
                ForEach(emojiGame.cards) { card in
                    CardView(card: card, cardColor: emojiGame.themeColor)
                        .onTapGesture { emojiGame.choose(card) }
                        .padding(4)
                }
            }
                .foregroundColor(emojiGame.themeColor)
        }
            .animation(.default, value: emojiGame.cards)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    let cardColor: Color
    
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .scaledToFit()
            }
            .opacity(card.isFaceUp ? 1 : 0)
            Circle()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180),
                            axis: (0, 1, 0))
        .animation(.easeInOut(duration: 0.3), value: card.isFaceUp)
    }
}


#Preview {
    EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
}
