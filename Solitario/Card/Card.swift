//
//  Card.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct Card {
    private(set) var rank: Int
    var suit: Suit
    var isFaceUp: Bool
    var location: SolitarioGame.Location
    
    init(rank: Int, suit: Suit, isFaceUp: Bool = true, location: SolitarioGame.Location) {
        self.rank = rank
        self.suit = suit
        self.isFaceUp = isFaceUp
        self.location = location
    }
    
    func giveTheRank() -> String {
        switch rank {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "\(rank)"
        }
    }
}

extension Card {
    static let empty = Card(rank: 0, suit: .spades, isFaceUp: false, location: .deck)
}
