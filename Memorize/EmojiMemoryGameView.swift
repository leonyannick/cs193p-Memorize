//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI



struct EmojiMemoryGameView: View {
    var emojiGame = EmojiMemoryGame()
    
    let purpleTheme = ["😈", "🍆", "💜", "👾", "🔮"]
    let greenTheme = ["🤢", "🐉", "🐍", "🍀", "🦖", "💚"]
    let blueTheme = ["🧿", "💙", "🔵", "🌊", "💤", "🌀"]
    
    @State var selectedCardColor: Color?
    @State var duplicatedAndShuffledCards: [String]?
    
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
                    CardView(content: card.content, cardColor: .green)
                }
                .padding()
            }
        }
    }
    
  
    
   
}


struct CardView: View {
    let content: String
    let cardColor: Color
    
    @State var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .stroke(cardColor, lineWidth: 3)
            Text(content).font(.largeTitle)
            Circle()
                .fill(cardColor)
                .opacity(isFlipped ? 1 : 0)
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}










#Preview {
    EmojiMemoryGameView()
}
