//
//  StackView.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

//struct StackView: View {
//    var index: Int
//    @ObservedObject var game: EmojiSolitarioGame
//    var cardFrames: [[CGRect]]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.white, lineWidth: 2)
//                    .opacity(0.2)
//                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 2)
//                VStack {
//                    ForEach(self.game.stacksOfCards[index].indices, id: \.self) { cardIndex in
//                        CardView(card: self.game.stacksOfCards[index][cardIndex], onEnded: self.cardDropped, size: geometry.size)
//                        .overlay(
//                            GeometryReader { geometry in
//                                Color.clear
//                                .onAppear {
//                                    self.cardFrames[index][cardIndex] = geometry.frame(in: .global)
//                                }
//                            }
//                        )
//                    }
//                }
//            }
//        }
//    }
//}

//struct StackView_Previews: PreviewProvider {
//    static var previews: some View {
//        StackView()
//    }
//}
