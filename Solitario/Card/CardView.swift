//
//  CardView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                VStack {
                    HStack {
                        Text("\(card.number)")
                            .foregroundColor(.black)
                        Text(card.suit.symbol)
                        Spacer()
                    }
                    Text(card.suit.symbol)
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
            }
        }
//            .frame(width: 200, height: 400)
            .aspectRatio(2/3, contentMode: .fit)
        .onDrag {
            return NSItemProvider(object: self.card)
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: Card(number: 2, suit: .diamonds))
//    }
//}
