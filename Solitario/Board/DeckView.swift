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
    
    @State var isPresented = false
    
    var boardSize: CGSize
    
    init(in boardSize: CGSize) {
        self.boardSize = boardSize
    }
    
    var body: some View {
        VStack {
            CardView(card: .empty, in: self.boardSize)
                .onTapGesture {
                    self.game.deckWasClicked()
                    self.deckIndex += 3
                    self.deckWasTapped = true
                    if self.deckIndex >= self.game.deckOfCards.count {
                        self.deckIndex = -3
                        self.deckWasTapped = false
                    }
                }
                .padding(.top)
            if deckWasTapped {
                VStack {
                    ForEach(deckIndex..<deckIndex+3, id: \.self) { cardIndex in
                        ZStack {
                            if cardIndex < self.game.deckOfCards.count {
                                CardView(card: self.game.deckOfCards[cardIndex], onEnded: self.game.drop, in: self.boardSize)
                                    .animation(Animation.linear.delay(Double(self.deckIndex - cardIndex) * 0.6))
                            } else {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            Rectangle() //  Para que el mazo se quede en su sitio
                .opacity(0)
        }
            .frame(maxWidth: boardSize.width / 9, maxHeight: boardSize.height)
            .background(Color("DarkGreen"))
    }
}
