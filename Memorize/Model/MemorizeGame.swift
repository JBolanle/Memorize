//
//  MemorizeGameModel.swift
//  Memorize
//
//  Created by Jumoke Bolanle on 12/3/23.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {

    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
