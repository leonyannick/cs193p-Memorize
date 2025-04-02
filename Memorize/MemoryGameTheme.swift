//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Leon Baumann on 28.03.25.
//

import Foundation

struct MemoryGameTheme {
    let name: String
    let setOfEmojis: [String]
    let numberOfPairs: Int
    let color: String
    
    init() {
        let randomTheme = themes.randomElement() ?? ("passion", ["❤️", "💋", "🌹", "🍎", "🍓", "🔥", "🎈", "🧧", "🚗", "🏓"], 10, "red")
        self.name = randomTheme.name
        self.setOfEmojis = randomTheme.setOfEmojis.shuffled()
        self.numberOfPairs = randomTheme.numberOfPairs
        self.color = randomTheme.color
    }
    
    private let themes: [(name: String, setOfEmojis: Set<String>, numberOfPairs: Int, color: String)] =
        [
            ("passion", ["❤️", "💋", "🌹", "🍎", "🍓", "🔥", "🎈", "🧧", "🚗", "🏓"], 10, "red"),
            ("autumn", ["🦊", "🍊", "🎃", "🧡", "🍁", "🌅", "🏀", "🦁", "🔥", "✴️"], 9, "orange"),
            ("sunshine", ["🌞", "🌻", "🍌", "🐥", "⭐", "🧀", "🚕", "⚠️", "🏅", "🔆"], 8, "yellow"),
            ("nature", ["🌿", "🌳", "🍏", "🥑", "🐢", "🐍", "💚", "🍀", "🚜", "🦖"], 7, "green"),
            ("ocean", ["🌊", "🐳", "💙", "🌀", "🦋", "🔵", "🎽", "🚙", "🧊", "🎵"], 6, "blue"),
            ("magic", ["🟣", "🔮", "🦄", "🍇", "💜", "👾", "🎭", "👑", "🚀", "☂️"], 5, "purple")
        ]
    
    func cardContentFactory(_ index: Int) -> String {
        if (index >= 0 && index < setOfEmojis.count) { return setOfEmojis[index] }
            else { return "‼" }
    }
}

