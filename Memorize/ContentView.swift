//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI



struct ContentView: View {
    let purpleTheme = ["😈", "🍆", "💜", "👾", "💟", "✝️", "🛐", "🔮", "☂️", "🕺"]
    let greenTheme = ["🤢", "🐉", "🐍", "🍀", "🦖", "💚"]
    let blueTheme = ["🧿", "💙", "🔵", "🌊", "💤", "🌀"]
    
    @State var selectedTheme: [String] = []
    
    var body: some View {
        VStack {
            Text("Memorize").font(.title)
            cards
            
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
        .padding()
    }
    
    var cards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(selectedTheme, id: \.self) { theme in
                    CardView(content: theme)
                }
                .padding()
            }
        }
    }
    
    func themeChooser(theme: [String], buttonColor: Color = .blue) -> some View {
        Button(action: {
            selectedTheme = theme
        }, label: {
            Image(systemName: "circle.fill")
                .foregroundColor(buttonColor)
                .font(.title)
        })
    }
    
    var choosePurpleTheme:  some View {
        themeChooser(theme: purpleTheme, buttonColor: Color.purple)
    }
    
    var chooseBlueTheme:  some View {
        themeChooser(theme: blueTheme, buttonColor: Color.blue)
    }
    
    var chooseGreenTheme:  some View {
        themeChooser(theme: greenTheme, buttonColor: Color.green)
    }
}


struct CardView: View {
    let content: String
    
    @State var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .stroke(.purple, lineWidth: 3)
            Text(content).font(.largeTitle)
            Circle()
                .fill(.purple)
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
