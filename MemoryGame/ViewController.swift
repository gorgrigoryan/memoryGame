//
//  ViewController.swift
//  MemoryGame
//
//  Created by 1 on 9/3/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = MemoryGame(numberOfPairsOfCards: cardButtons.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip Count : \(flipCount)"
        }
    }
    
    @IBOutlet weak var gameRepeatButton: UIButton!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchButton(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            if !game.cards[cardNumber].isMatched {
                flipCount += 1
            }
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            if game.countOfNotMatchedPairsOfCards == 0 {
                gameRepeatButton.isHidden = false
            }
        }
    }
    
    @IBAction func repeatGame(_ sender: UIButton) {
        flipCount = 0
        game.dropValues()
        updateViewFromModel()
        game.cards.shuffle()
        gameRepeatButton.isHidden = true
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
            } else {
                button.backgroundColor = card.isMatched ? UIColor.clear : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
    }
    
    var emojiChoices = ["🍍", "🥥", "🍓", "🍒", "🍉", "🍏", "🍎", "🍋", "🍇", "🍐"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

