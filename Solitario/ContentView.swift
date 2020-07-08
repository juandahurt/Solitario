//
//  ContentView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = EmojiSolitarioGame()
    
    var body: some View {
        BoardView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
