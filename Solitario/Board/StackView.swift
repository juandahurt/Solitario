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
    
    var stackIndex: Int
    var yOffset: CGFloat = 25
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .opacity(0)
            ForEach(self.game.stacksOfCards[stackIndex].indices, id: \.self) { cardIndex in
                CardView(card: self.game.stacksOfCards[self.stackIndex][cardIndex], onEnded: self.game.drop)
                    .offset(x: 0, y: self.yOffset * CGFloat(cardIndex))
                    .padding(.top)
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
