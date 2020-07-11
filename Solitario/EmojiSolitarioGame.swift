//
//  EmojiSolitarioGame.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

class EmojiSolitarioGame: ObservableObject {
    @Published private var game = SolitarioGame()
    
    func drop(card: Card, at location: SolitarioGame.Location) {
        game.drop(card: card, at: location)
    }
    
    var stacksOfCards: [[Card]] {
        return game.stacksOfCards
    }
}
