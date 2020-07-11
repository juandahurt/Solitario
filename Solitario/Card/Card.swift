//
//  Card.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct Card {
    var number: Int
    var suit: Suit
    var isFaceUp: Bool
    var location: SolitarioGame.Location
    
    init(number: Int, suit: Suit, isFaceUp: Bool = true, location: SolitarioGame.Location) {
        self.number = number
        self.suit = suit
        self.isFaceUp = isFaceUp
        self.location = location
    }
}

struct Suit {
    var symbol: String  // TODO: ¿De qué forma volver esto un poco más genérico?
    
    static func from(string: String) -> Suit? {
        switch string {
        case Suit.clubs.symbol:
            return Suit.clubs
        case Suit.diamonds.symbol:
            return Suit.diamonds
        case Suit.hearts.symbol:
            return Suit.hearts
        case Suit.spades.symbol:
            return Suit.spades
        default:
            return nil
        }
    }
}

// MARK: - Suit list

extension Suit {
    static var clubs = Suit(symbol: "♣️")
    
    static var diamonds = Suit(symbol: "♦️")
    
    static var hearts = Suit(symbol: "♥️")
    
    static var spades = Suit(symbol: "♠️")
}
