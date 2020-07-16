//
//  BoardView.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                    HStack() {
                        DeckView()
                        Spacer()
                        HStack(alignment: .center, spacing: 30) {
                            ForEach(0..<4) { _ in
                                FinalStackView(in: geometry.size)
                            }
                        }
                    }
                    HStack {
                        ForEach(self.game.stacksOfCards.indices) { stackIndex in
                            StackView(stackIndex: stackIndex)
                        }
                    }
                }
                .padding()
                .background(Color.green)
            }
        }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .previewLayout(.fixed(width: 698, height: 290))
    }
}
