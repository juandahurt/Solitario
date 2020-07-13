//
//  FinalStackView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct FinalStackView: View {
    var size: CGSize
    
    init(in size: CGSize) {
        self.size = size
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
            .stroke(Color.white, lineWidth: 1)
            .opacity(0.3)
                .frame(width: size.width / 10, height: size.height / 4)
            Text("A")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .opacity(0.3)
        }
    }
}

