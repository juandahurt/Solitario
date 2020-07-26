//
//  StackView.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct StackView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var boardSize: CGSize
    var stackIndex: Int
    var yOffset: CGFloat = 25
    
    init(in boardSize: CGSize, stackIndex: Int) {
        self.boardSize = boardSize
        self.stackIndex = stackIndex
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .opacity(0)
            ForEach(self.game.stacksOfCards[stackIndex].indices, id: \.self) { cardIndex in
                CardView(card: self.game.stacksOfCards[self.stackIndex][cardIndex], onEnded: self.game.drop, in: self.boardSize)
                    .offset (x: 0, y: self.yOffset * CGFloat(cardIndex))
            }
        }
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                    .onAppear {
                        self.game.stacksFrames[self.stackIndex] = geometry.frame(in: .global)
                    }
                }
            )
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            StackView(in: geometry.size, stackIndex: 5)
                .environmentObject(EmojiSolitarioGame())
                .previewLayout(.fixed(width: 750, height: 300))
        }
    }
}
