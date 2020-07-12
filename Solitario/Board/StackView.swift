//
//  StackView.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct StackView: View {
    var stackIndex: Int
    var yOffset: CGFloat = 25
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
                .opacity(0.3)
            ForEach(self.game.stacksOfCards[stackIndex].indices, id: \.self) { cardIndex in
                CardView(card: self.game.stacksOfCards[self.stackIndex][cardIndex], onEnded: self.game.drop)
                    .offset(x: 0, y: self.yOffset * CGFloat(cardIndex))
            }
        }
            .padding(.vertical)
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                    .onAppear {
                        self.game.stacksFrames[self.stackIndex] = geometry.frame(in: .global)
                    }
                }
            )
    }
    
    func x() {
        
//        self.game.cardFrames[0][0].offsetBy(dx: 0, dy: self.yOffset * CGFloat(cardIndex))
    }
}

//struct StackView_Previews: PreviewProvider {
//    static var previews: some View {
//        StackView()
//    }
//}
