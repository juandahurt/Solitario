//
//  BoardButton.swift
//  Solitario
//
//  Created by Negro on 28/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    var text: String
    var screenSize: CGSize
    var image: String
    
    var action: () -> Void
    
    init(_ text: String, screenSize: CGSize, image: String, action: @escaping () -> Void) {
        self.text = text
        self.screenSize = screenSize
        self.image = image
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.4)
                    .shadow(radius: 2)
                    .cornerRadius(10)
                HStack {
                    Text(text)
                        .foregroundColor(.white)
                        .bold()
                        .font(.custom("", size: screenSize.width / 25))
                    Image(systemName: image)
                        .foregroundColor(.white)
                        .font(.custom("", size: screenSize.width / 25))
                }
            }
        }
            .buttonStyle(SquishableButton())
            .frame(maxWidth: screenSize.width / 2, maxHeight: screenSize.height / 4)
    }
}


struct BoardButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            VStack {
                MenuButton("Preview button", screenSize: geometry.size, image: "house", action: {})
            }
        }
            .background(Color("DarkGreen"))
    }
}
