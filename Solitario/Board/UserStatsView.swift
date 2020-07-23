//
//  UserStatsView.swift
//  Solitario
//
//  Created by Negro on 22/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import SwiftUI

struct UserStatsView: View {
    @EnvironmentObject var game: EmojiSolitarioGame
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentTime: Date?
    
    var body: some View {
        HStack {
            Spacer()
            Text(currentTime == nil ? "00:00:00" : "\(currentTime!.toString())")
                .foregroundColor(.white)
                .onReceive(timer) { _ in
                    if let time = self.currentTime {
                        self.update(time: time)
                    } else {
                        let formatter = DateFormatter()
                        let emptyDate = "00:00:00"
                        formatter.dateFormat = "HH:mm:ss"
                        self.currentTime = formatter.date(from: emptyDate)!
                        self.update(time: self.currentTime!)
                    }
                }
            Spacer()
            Text("Moves: \(self.game.moves)")
                .foregroundColor(.white)
            Spacer()
            Text("Score: \(self.game.score)")
                .foregroundColor(.white)
            Spacer()
        }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .padding(0)
            .animation(.none)
    }
    
    func update(time: Date) {
        let calendar = Calendar.current
        let oneSecond = DateComponents(second: 1)
        self.currentTime = calendar.date(byAdding: oneSecond, to: time)
    }
}

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter.string(from: self)
    }
}
