//
//  MemoryGame.swift
//  Memorize
//
//  Created by Georgi Teoharov on 30.05.20.
//  Copyright © 2020 CS193p Freelancer. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    mutating func chooseCard(card: Card) {
        if let choosenIndex = cards.firstIndex(matching: card), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched {
            if let potentionalMatch = indexOfOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentionalMatch].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentionalMatch].isMatched = true
                }
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = choosenIndex
            }
            self.cards[choosenIndex].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
