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
    var onEnded: ((CGPoint, Card) -> Void)?
    
    var size: CGSize
    
    var body: some View {
        Group {
            if card.isFaceUp {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.black)
                    VStack {
                        HStack {
                            Text("\(card.number)")
                                .foregroundColor(.black)
                            Text(card.suit.symbol)
                            Spacer()
                        }
                        Text(card.suit.symbol)
                    }
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
            }
        }
        .frame(width: 70, height: 100)
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .gesture(
            DragGesture(coordinateSpace: .global)
            .onChanged() {
                self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
            }
            .onEnded() {
                self.onEnded?($0.location, self.card)
                self.dragAmount = .zero
            }
        )
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: Card(id: 1, number: 2, suit: .diamonds, location: .stacks(0)))
//    }
//}
