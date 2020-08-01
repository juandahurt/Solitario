//
//  MainMenuView.swift
//  Solitario
//
//  Created by Negro on 29/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    var screenSize: CGSize
    
    var body: some View {
        ZStack {
            RainingCards(screenSize: screenSize)
            VStack {
                Text("Solitario")
                    .font(.custom("", size: screenSize.height / 5))
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                VStack {
                    MenuButton("Back to game", screenSize: screenSize, image: "arrow.left", action: {
                        withAnimation(.linear) {
                            self.game.isMenuActive(false)
                        }
                    })
                    MenuButton("New Game", screenSize: screenSize, image: "plus", action: {
                        self.game.newGame()
                        withAnimation(.linear) {
                            self.game.isMenuActive(false)
                        }
                    })
                }
            }
        }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGreen"))
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            MainMenuView(screenSize: geometry.size)
        }
    }
}
