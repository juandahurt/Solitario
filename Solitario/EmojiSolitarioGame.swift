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
        guard let stackIndexWhereTheCardIs = game.find(card: card) else { return }
        switch location {
        case .stacks(let stackIndexWhereTheCardWantsToGo):
            game.drop(card: card, at: stackIndexWhereTheCardWantsToGo, from: stackIndexWhereTheCardIs)
        default:
            print("Not implemented yet!")
        }
//        game.stacksOfCards[stackIndexWhereTheCardIs].remove(at: 1)
//        game.stacksOfCards[stackIndexWhereTheCardWantsToBe].append(card)
    }
    
    var stacksOfCards: [[Card]] {
        return game.stacksOfCards
    }
}
