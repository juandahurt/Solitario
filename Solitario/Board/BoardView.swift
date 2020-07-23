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
            VStack(alignment: .leading, spacing: 0) {
                UserStatsView(in: geometry.size)
                HStack(alignment: .top, spacing: 0) {
                    DeckView(in: geometry.size)
                    HStack {
                        ForEach(self.game.stacksOfCards.indices) { stackIndex in
                            StackView(in: geometry.size, stackIndex: stackIndex)
                        }
                    }
                        .padding(.top)
                    VStack(alignment: .center, spacing: 10) {
                        Spacer()
                        ForEach(0..<4) { stackIndex in
                            FinalStackView(in: geometry.size, stackIndex: stackIndex)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: geometry.size.width / 9, maxHeight: geometry.size.height)
                    .background(Color("DarkGreen"))
                }
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
