//
//  ContentView.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BoardView().environmentObject(EmojiSolitarioGame())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
