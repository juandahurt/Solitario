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
    
    var boardSize: CGSize
    
    init(in boardSize: CGSize) {
        self.boardSize = boardSize
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 1) {
            Button(action: { self.game.isMenuActive(true) }) {
                Image(systemName: "house")
                    .foregroundColor(.white)
                    .font(.title)
            }
                .frame(width: boardSize.width / 9)
            Spacer()
            Group {
                VStack {
                    Text("Time")
                        .fontWeight(.heavy)
                    Text(currentTime == nil ? "00:00:00" : "\(currentTime!.toString())")
                        .fontWeight(.heavy)
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
                        .frame(width: boardSize.width / 4)
                }
                VStack {
                    Text("Moves")
                        .fontWeight(.heavy)
                    Text("\(self.game.moves)")
                        .fontWeight(.heavy)
                        .frame(width: boardSize.width / 4)
                }
                VStack {
                    Text("Score")
                        .fontWeight(.heavy)
                    Text("\(self.game.score)")
                        .fontWeight(.heavy)
                        .frame(width: boardSize.width / 4)
                }
                Spacer()
            }
        }
        .frame(maxWidth: self.boardSize.width, maxHeight: self.boardSize.height / 6)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
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
