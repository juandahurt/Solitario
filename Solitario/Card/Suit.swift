//
//  Suit.swift
//  Solitario
//
//  Created by Negro on 21/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct Suit {
    var symbol: String  // TODO: ¿De qué forma volver esto un poco más genérico?
    var color: Color
    
    enum Color {
        case black
        case red
    }
}

extension Suit {
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

//extension Suit: Equatable {
//    static func == (lhs: Suit, rhs: Suit) -> Bool {
//        return lhs.symbol == rhs.symbol && lhs.color == rhs.color
//    }
//}


// MARK: - Suit list

extension Suit {
    static var clubs = Suit(symbol: "♣️", color: .black)
    
    static var diamonds = Suit(symbol: "♦️", color: .red)
    
    static var hearts = Suit(symbol: "♥️", color: .red)
    
    static var spades = Suit(symbol: "♠️", color: .black)
}
