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
    @State var cardFrames = [[CGRect]](repeating: [CGRect](repeating: .zero, count: 7), count: 7)
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ForEach(self.game.stacksOfCards.indices) { stackIndex in
                        VStack {
                            ForEach(self.game.stacksOfCards[stackIndex].indices, id: \.self) { cardIndex in
                                CardView(card: self.game.stacksOfCards[stackIndex][cardIndex], onEnded: self.cardDropped, size: geometry.size)
                                .overlay(
                                    GeometryReader { geometry in
                                        Color.clear
                                        .onAppear {
                                            self.cardFrames[stackIndex][cardIndex] = geometry.frame(in: .global)
                                        }
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
        .background(Color.green)
    }
    
    func cardDropped(at location: CGPoint, card: Card) {
        for stackIndex in self.game.stacksOfCards.indices {
            if let _ = cardFrames[stackIndex].firstIndex(where: { $0.contains(location) }) {
                game.drop(card: card, at: .stacks(stackIndex, nil))
                return
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .previewLayout(.fixed(width: 698, height: 290))
    }
}
