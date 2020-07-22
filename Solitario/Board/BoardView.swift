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
                VStack {
                    HStack {
                        Spacer()
                        Text("00:00:00")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Moves: \(self.game.score)")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Score: \(self.game.score)")
                            .foregroundColor(.white)
                        Spacer()
                    }
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .padding(0)
                    HStack() {
                        DeckView()
                        Spacer()
                        HStack(alignment: .center, spacing: 30) {
                            ForEach(0..<4) { stackIndex in
                                FinalStackView(in: geometry.size, stackIndex: stackIndex)
                            }
                        }
                    }
                        .padding(.horizontal)
                }
                HStack {
                    ForEach(self.game.stacksOfCards.indices) { stackIndex in
                        StackView(stackIndex: stackIndex)
                    }
                }
                    .padding(.horizontal, 5)
            }
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
