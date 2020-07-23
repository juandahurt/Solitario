//
//  CardView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @State private var dragAmount = CGSize.zero
    
    var card: Card
    var onEnded: ((Card, CGPoint) -> Void)?
    
    var yOffset: CGFloat?
    var boardSize: CGSize
    
    init(card: Card, onEnded: ((Card, CGPoint) -> Void)?, yOffset: CGFloat?, in boardSize: CGSize) {
        self.card = card
        self.onEnded = onEnded
        self.yOffset = yOffset
        self.boardSize = boardSize
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .fill(Color.white)
                        .shadow(radius: 2)
                    VStack {
                        HStack {
                            Text(self.card.giveTheRank())
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
            }
                .opacity(self.card.isFaceUp ? 1: 0)
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.blue)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
            }
                .opacity(self.card.isFaceUp ? 0 : 1)
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
                    withAnimation(self.card.location != .deck ? .linear : .none) {
                        self.onEnded?(self.card, point.location)
                    }
                }
                self.dragAmount = .zero
            }
        )
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 0, y: 1 ,z: 0))
            .rotation3DEffect(self.card.isFaceUp ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: 0, y: 1,  z: 0))
            .transition(.identity)
    }
    
    // MARK: - UI Constants
    
    private let cornerRadius: CGFloat = 5
    private let shadowRadius: CGFloat = 2
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: Card(id: 1, number: 2, suit: .diamonds, location: .stacks(0)))
//    }
//}
