//
//  Card.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

final class Card: NSObject, Identifiable {
    var id: Int
    var number: Int
    var suit: Suit
    var isFaceUp: Bool
    
    init(id: Int, number: Int, suit: Suit, isFaceUp: Bool = true) {
        self.id = id
        self.number = number
        self.suit = suit
        self.isFaceUp = isFaceUp
    }
}

struct Suit {
    var symbol: String  // TODO: ¿De qué forma volver esto un poco más genérico?
}

// MARK: - Suit list

extension Suit {
    static var clubs = Suit(symbol: "♣️")
    
    static var diamonds = Suit(symbol: "♦️")
    
    static var hearts = Suit(symbol: "♥️")
    
    static var spades = Suit(symbol: "♠️")
}
