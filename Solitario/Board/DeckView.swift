//
//  DeckView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    @State var deckIndex = -3
    @State var deckWasTapped = false
    
    var body: some View {
        HStack {
            CardView(card: Card(rank: 0, suit: .clubs, isFaceUp: false, location: .deck))
                .onTapGesture {
                    self.deckIndex += 3
                    self.deckWasTapped = true
                    if self.deckIndex >= self.game.deckOfCards.count {
                        self.deckIndex = -3
                        self.deckWasTapped = false
                    }
                }
            if deckWasTapped {
                ForEach(deckIndex..<deckIndex+3, id: \.self) { cardIndex in
                    VStack {
                        if cardIndex < self.game.deckOfCards.count {
                            CardView(card: self.game.deckOfCards[cardIndex], onEnded: self.game.drop)
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}
