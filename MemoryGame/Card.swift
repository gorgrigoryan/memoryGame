//
//  Card.swift
//  MemoryGame
//
//  Created by 1 on 9/10/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var uniqueIdentifier = 0
    
    init() {
        self.identifier = Card.generateUniqueIdentifier()
    }
    
    static func generateUniqueIdentifier() -> Int {
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
}
