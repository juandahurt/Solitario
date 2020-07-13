//
//  CardView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

enum DragState {
    case valid
    case unvalid
    case unknown
}

struct CardView: View {
    @State private var dragAmount = CGSize.zero
    @State private var dragState: DragState = .unknown
    
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
                                Text("\(self.card.number)")
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
        .frame(width: 70, height: 100)
        .offset(x: 0, y: yOffset ?? 0)
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .gesture(
            DragGesture(coordinateSpace: .global)
            .onChanged() {
                if self.card.isFaceUp {
                    self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                }
            }
            .onEnded() {
                if self.card.isFaceUp {
                    self.onEnded?(self.card, $0.location)
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
