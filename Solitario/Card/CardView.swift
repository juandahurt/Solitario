//
//  CardView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    @State private var dragAmount = CGSize.zero
    
    var card: Card
    var onEnded: ((Card, CGPoint) -> Void)?
    
    var transition: AnyTransition
    
    var yOffset: CGFloat?
    var boardSize: CGSize
    
    init(card: Card, onEnded: ((Card, CGPoint) -> Void)?, in boardSize: CGSize) {
        self.card = card
        self.onEnded = onEnded
        self.boardSize = boardSize
        self.transition = .identity
    }
    
    init(card: Card, in boardSize: CGSize) {
        self.card = card
        self.boardSize = boardSize
        self.transition = .identity
    }
    
    init(card: Card, in boardSize: CGSize, transition: AnyTransition) {
        self.card = card
        self.boardSize = boardSize
        self.transition = transition
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Text(self.card.giveMeTheRepresentationOfTheRank())
                            .bold()
                            .foregroundColor(.black)
                        Text(self.card.suit.symbol)
                            .font(.custom("", size: geometry.size.width / 3))
                    }
                    Spacer()
                    Text(self.card.suit.symbol)
                        .font(.custom("", size: geometry.size.width / 1.5))
                }
                .padding(.top, 5)
            }
                .flippableCard(isFaceUp: card.isFaceUp)
        }
        .offset(x: 0, y: yOffset ?? 0)
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .frame(width: self.boardSize.width / 14, height: self.boardSize.height / 6)
        .gesture(
            DragGesture(coordinateSpace: .global)
            .onChanged() { point in
                if self.card.isFaceUp {
                    switch self.card.location {
                    case .finalStacks(_):
                        return
                    default:
                        self.dragAmount = CGSize(width: point.translation.width, height: point.translation.height)
                    }
                }
            }
            .onEnded() { point in
                if self.card.isFaceUp {
                    withAnimation(.linear(duration: 0.2)) {
                        self.onEnded?(self.card, point.location)
                    }
                }
                self.dragAmount = .zero
            }
        )
            .transition(self.transition)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            CardView(card: Card(rank: 2, suit: .diamonds, location: .stacks(0, nil)), in: geometry.size)
        }
        
    }
}
