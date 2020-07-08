//
//  BoardView.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var game = EmojiSolitarioGame()
    
    var body: some View {
        HStack {
            ForEach(0..<game.stacksOfCards.count) { stackIndex in
                DroppableArea(of: Card.self, onDropPerform: { object in
                    self.game.drop(card: object as! Card, at: .stacks(stackIndex))
                }) {
                    VStack {
                        ForEach(self.game.stacksOfCards[stackIndex]) { card in
                            CardView(card: card)
                            .background(Color.white.shadow(radius: 10))
                            .padding()
                        }
                    }
                }.background(Color.white)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
