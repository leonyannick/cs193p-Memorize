//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Leon Baumann on 10.03.25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(emojiGame: game)
        }
    }
}
