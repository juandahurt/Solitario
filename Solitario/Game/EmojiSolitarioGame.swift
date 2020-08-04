//
//  EmojiSolitarioGame.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation
import SwiftUI

class EmojiSolitarioGame: ObservableObject {
    @Published private var game = SolitarioGame()
    @Published var stacksFrames = [CGRect](repeating:  .zero, count: 7)
    @Published var aceStackFrames = [CGRect](repeating: .zero, count: 4)
    @Published var isMenuActive = true
    
    func newGame() {
        self.game = SolitarioGame()
    }
    
    func isMenuActive(_ bool: Bool) {
        self.isMenuActive = bool
    }
    
    func drop(card: Card, at location: CGPoint) {
        if let stackIndex = stacksFrames.firstIndex(where: { $0.contains(location) }) {
            game.drop(card: card, at: .stacks(stackIndex, nil))
        } else if let finalStackIndex = aceStackFrames.firstIndex(where: { $0.contains(location) }) {
            game.drop(card: card, at: .aceStacks(finalStackIndex))
        }
    }
    
    func deckWasClicked() {
        game.touchDeck()
    }
    
    var stacksOfCards: [[Card]] {
        game.stacksOfCards
    }
    
    var aceStacksOfCards: [[Card]?] {
        game.aceStacksOfCards
    }
    
    var deckOfCards: [Card] {
        game.deckOfCards
    }
    
    var score: Int {
        game.score
    }
    
    var moves: Int {
        game.moves
    }
}
