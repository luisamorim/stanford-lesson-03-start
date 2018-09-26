//
//  Concentration.swift
//  Concentration
//
//  Created by Luis Henrique de Oliveira Amorim on 9/25/18.
//  Copyright © 2018 Luis Henrique de Oliveira Amorim. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(at index: Int){
        // 3 states
        // 1). no cards faceUp
        // 2). two cards faceUp - matched or not
        // 3). on3 card faceUp and I choose some other card.
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index { // se vc ja escolheu uma.
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                   cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else {
                // either no cards or 2 cards faceUp
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        
    }
    
    // TODO: shuffle the cards
}
