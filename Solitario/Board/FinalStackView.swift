//
//  FinalStackView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct FinalStackView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var size: CGSize
    var stackIndex: Int
    
    init(in size: CGSize, stackIndex: Int) {
        self.size = size
        self.stackIndex = stackIndex
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
           RoundedRectangle(cornerRadius: 5)
           .stroke(Color.white, lineWidth: 1)
           .opacity(0.2)
               .frame(width: size.width / 10, height: size.height / 4)
           Text("A")
               .font(.custom("", size: self.size.width / 15))
               .foregroundColor(Color.white)
               .opacity(0.2)
            if game.finalStacksOfCards[stackIndex] != nil {
                CardView(card: game.finalStacksOfCards[stackIndex]!)
            }
       }
       .overlay(
           GeometryReader { geometry in
               Color.clear
                   .onAppear {
                       self.game.finalStackFrames[self.stackIndex] = geometry.frame(in: .global)
                   }
           }
       )
    }
}

