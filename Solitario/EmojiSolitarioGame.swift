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
    @Published var game = SolitarioGame()
    @Published var stacksFrames = [CGRect](repeating:  .zero, count: 7)
    
    func drop(card: Card, at location: CGPoint) {
        if let stackIndex = stacksFrames.firstIndex(where: { $0.contains(location) }) {
            game.drop(card: card, at: .stacks(stackIndex, nil))
        }
    }
    
    var stacksOfCards: [[Card]] {
        return game.stacksOfCards
    }
}
