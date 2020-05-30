//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Georgi Teoharov on 30.05.20.
//  Copyright © 2020 CS193p Freelancer. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    
    private var modelGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😎", "😉", "🥳", "😃", "😘"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        modelGame.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        modelGame.chooseCard(card: card)
    }
}
