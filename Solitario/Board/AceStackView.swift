//
//  AceStackView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct AceStackView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var boardSize: CGSize
    var stackIndex: Int
    
    init(in boardSize: CGSize, stackIndex: Int) {
        self.boardSize = boardSize
        self.stackIndex = stackIndex
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.green)
                .frame(width: boardSize.width / 14, height: boardSize.height / 6)
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.white, lineWidth: 2)
                .opacity(0.3)
                .frame(width: boardSize.width / 14, height: boardSize.height / 6)
            Text("A")
               .font(.custom("", size: self.boardSize.width / 15))
               .foregroundColor(Color.white)
               .opacity(0.3)
            if game.aceStacksOfCards[stackIndex] != nil {
                ZStack {
                    ForEach(game.aceStacksOfCards[stackIndex]!.indices, id: \.self) { cardIndex in
                        CardView(
                            card: self.game.aceStacksOfCards[self.stackIndex]![cardIndex],
                            in: self.boardSize
                        )
                    }
                }
            }
       }
       .overlay(
           GeometryReader { geometry in
               Color.clear
                   .onAppear {
                       self.game.aceStackFrames[self.stackIndex] = geometry.frame(in: .global)
                   }
           }
       )
    }
}

