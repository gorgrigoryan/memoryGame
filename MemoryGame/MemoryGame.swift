//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by 1 on 9/10/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

class MemoryGame {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var countOfNotMatchedPairsOfCards: Int
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    countOfNotMatchedPairsOfCards -= 1
                }
            } else {
                for cardIndex in cards.indices {
                    cards[cardIndex].isFaceUp = false
                }
            }
            indexOfOneAndOnlyFaceUpCard = indexOfOneAndOnlyFaceUpCard == nil ? index : nil
            cards[index].isFaceUp = true
        }
    }
    
    func dropValues() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        countOfNotMatchedPairsOfCards = cards.count / 2
    }
    
    init(numberOfPairsOfCards: Int) {
        countOfNotMatchedPairsOfCards = numberOfPairsOfCards
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
