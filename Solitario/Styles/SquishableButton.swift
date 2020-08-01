//
//  SquishableButton.swift
//  Solitario
//
//  Created by Negro on 28/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct SquishableButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}
