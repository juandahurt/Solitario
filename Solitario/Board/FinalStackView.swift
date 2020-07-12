//
//  FinalStackView.swift
//  Solitario
//
//  Created by Negro on 11/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct FinalStackView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            .stroke(Color.white, lineWidth: 1)
            .opacity(0.3)
            .frame(width: 70, height: 100)
            Text("A")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .opacity(0.3)
        }
        
    }
}

