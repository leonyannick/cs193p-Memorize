//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI



struct ContentView: View {
    let purpleTheme = ["😈", "🍆", "💜", "👾", "🔮"]
    let greenTheme = ["🤢", "🐉", "🐍", "🍀", "🦖", "💚"]
    let blueTheme = ["🧿", "💙", "🔵", "🌊", "💤", "🌀"]
    
    @State var selectedCardColor: Color?
    @State var duplicatedAndShuffledCards: [String]?
    
    var body: some View {
        VStack {
            Text("Memorize").font(.title)
            cards
            themeNavigation
        }
        .padding()
    }
    
    var themeNavigation: some View {
        HStack {
            Spacer()
            choosePurpleTheme
            Spacer()
            chooseBlueTheme
            Spacer()
            chooseGreenTheme
            Spacer()
        }
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                if let duplicatedAndShuffledCards {
                    ForEach(duplicatedAndShuffledCards.indices, id: \.self) { index in
                        CardView(content: duplicatedAndShuffledCards[index], cardColor: selectedCardColor ?? .white)
                    }
                    .padding()
                }
            }
        }
    }
    
    func themeChooser(theme: [String], buttonColor: Color = .blue, buttonText: String) -> some View {
        Button(action: {
            selectedCardColor = buttonColor
            duplicatedAndShuffledCards = (theme + theme).shuffled()
        }, label: {
            VStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(buttonColor)
                    .font(.title)
                Text(buttonText)
                    .foregroundColor(buttonColor)
            }
        })
    }
    
    var choosePurpleTheme:  some View {
        themeChooser(theme: purpleTheme, buttonColor: Color.purple, buttonText: "purple")
    }
    
    var chooseBlueTheme:  some View {
        themeChooser(theme: blueTheme, buttonColor: Color.blue, buttonText: "blue")
    }
    
    var chooseGreenTheme:  some View {
        themeChooser(theme: greenTheme, buttonColor: Color.green, buttonText: "green")
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
    ContentView()
}
