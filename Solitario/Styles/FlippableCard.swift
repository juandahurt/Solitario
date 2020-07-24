//
//  FlippableCard.swift
//  Solitario
//
//  Created by Negro on 24/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct FlippableCard: AnimatableModifier {
    var rotation: Double
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    init(isFaceup: Bool) {
        rotation = isFaceup ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                    .shadow(radius: shadowRadius)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.blue)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
            }
                .opacity(isFaceUp ? 0 : 1)
        }
            .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    // MARK: - UI Constants
    
    private let cornerRadius: CGFloat = 5
    private let shadowRadius: CGFloat = 2
}

extension View {
    func flippableCard(isFaceUp: Bool) -> some View {
        self.modifier(FlippableCard(isFaceup: isFaceUp))
    }
}
