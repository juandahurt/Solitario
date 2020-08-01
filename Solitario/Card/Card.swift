//
//  Card.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct Card {
    private(set) var rank: Rank
    var suit: Suit
    var isFaceUp: Bool
    var location: SolitarioGame.Location
    
    init(rank: Int, suit: Suit, isFaceUp: Bool = true, location: SolitarioGame.Location) {
        self.rank = Rank(value: rank)
        self.suit = suit
        self.isFaceUp = isFaceUp
        self.location = location
    }
    
    func giveMeTheRepresentationOfTheRank() -> String {
        rank.giveMeYourRepresentation()
    }
}

extension Card {
    static let empty = Card(rank: 0, suit: .spades, isFaceUp: false, location: .deck)
    
    static func random() -> Card {
        let suits: [Suit] = [.clubs, .diamonds, .hearts, .spades]
        let randomSuit = suits.randomElement()!
        
        let isFaceup = Double.random(in: 0...1) > 0.7
        
        return Card(
            rank: Int.random(in: 1...13),
            suit: randomSuit,
            isFaceUp: isFaceup,
            location: .deck
        )
    }
}
