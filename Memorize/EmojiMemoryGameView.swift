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
            themeInfo
            cards
                .animation(.default, value: emojiGame.cards)
            newGameButton
        }
        .padding()
    }
    
    var themeInfo: some View {
        Text(emojiGame.themeName)
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
                    .minimumScaleFactor(0.001)
                    .aspectRatio(1, contentMode: .fit)
                    .scaledToFit()
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            Circle()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}








#Preview {
    EmojiMemoryGameView(emojiGame: EmojiMemoryGame())
}
