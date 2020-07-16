//
//  DeckView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct DeckView: View {
    var body: some View {
        CardView(card: Card(rank: 0, suit: .clubs, isFaceUp: false, location: .deck))
    }
}
