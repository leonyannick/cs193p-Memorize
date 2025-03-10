//
//  ContentView.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI



struct ContentView: View {
    let HalloweenTheme = ["🎃", "🧙‍♀️", "👻", "🧹"]
    
    var body: some View {
        VStack {
            Text("Memorize").font(.title)
            cards
            themeChooser
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(HalloweenTheme, id: \.self) { theme in
                CardView(content: theme)
            }
        }
    }
    
    var themeChooser:  some View {
        Button(action: {
            print("hello")
        }, label: {
            Image(systemName: "1.lane")
        })
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
