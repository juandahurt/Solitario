//
//  RainingCards.swift
//  Solitario
//
//  Created by Negro on 1/08/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct RainingCards: View {
    var screenSize: CGSize
    
    @State var numberOfCards = 40
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            if isPresented {
                ForEach(0..<numberOfCards) { cardIndex in
                    CardView(card: .random(), in: self.screenSize, transition: .move(edge: .top))
                        .opacity(0.3)
                        .offset(x: CGFloat(Int.random(in: 20...Int(self.screenSize.width))), y: -50)
                        .position(x: 0, y: self.screenSize.height)
                        .animation(Animation.linear.delay(0.6 * Double(cardIndex)).repeatForever(autoreverses: false))
                }
            }
        }
        .onAppear() {
            self.isPresented.toggle()
        }
        .onDisappear() {
            self.isPresented.toggle()
        }
    }
}
