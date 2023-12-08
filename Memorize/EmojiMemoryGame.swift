//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jumoke Bolanle on 12/3/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "👹", "💀", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
            return "⁉️"
        }
    }

    // A private model makes this full separation
    @Published private var model = createMemoryGame()



    // By making the model private, I need the view model to serve up the content from the model.
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
    }

    func newGame() {
        model.shuffle()
    }

    // Intent function - > the user's intent to choose a card
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
