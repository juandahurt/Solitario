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
    
    var body: some View {
        Group {
            if card.isFaceUp {
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
                                    .padding(.leading, 5)
                                Text(self.card.suit.symbol)
                                Spacer()
                            }
                            Spacer()
                            Text(self.card.suit.symbol)
                                .font(.custom("", size: geometry.size.width / 1.2))
                        }
                        .padding(.top, 5)
                    }
                }
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.blue)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                }
            }
        }
        .frame(width: 70, height: 100) // TODO: Las dimensiones de las cartas deben dependen del contenedor
        .offset(x: 0, y: yOffset ?? 0)
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
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
                    self.onEnded?(self.card, point.location)
                }
                self.dragAmount = .zero
            }
        )
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
