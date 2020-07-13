//
//  SolitarioGame.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation


// TODO: Crear todas las cartas de forma aleatoria y se van agregando a los demás componentes

struct SolitarioGame {
    var deckOfCards: [Card]
    var stacksOfCards: [[Card]]
    var finalStacksOfCards: [[Card]]  // Aquí es donde el usuario apilará las cartas para poder ganar
    
    enum Location {
        case deck
        case stacks(Int, Int?)  // Asocia el indice de la pila y el indice dentro de la pila
    }
    
    init() {
        deckOfCards = [Card]()
        stacksOfCards = [[Card]]()
        finalStacksOfCards = [[Card]]()
        
        let suits: [Suit] = [.clubs, .diamonds, .hearts, .spades]
        
        for suit in suits {
            for cardNumber in 2...10 {
                deckOfCards.append(Card(number: cardNumber, suit: suit, location: .deck))
            }
        }
        deckOfCards.shuffle()
        
        for stackIndex in 0..<7 {
            var stack = [Card]()
            for cardIndex in -1..<stackIndex {
                let randomIndex = Int.random(in: 0..<deckOfCards.count)
                var card = deckOfCards.remove(at: randomIndex)
                card.isFaceUp = false
                card.location = .stacks(stackIndex, cardIndex + 1)
                stack.append(card)
            }
            stack[stack.endIndex - 1].isFaceUp = true
            stacksOfCards.append(stack)
        }
    }
    
    func userCanJoin(cards: [Card]) -> Bool {
        let inititalCard = cards[0]
        let finalCard = cards[1]
        
        return inititalCard.number == finalCard.number - 1 && inititalCard.suit.color != finalCard.suit.color
    }
    
    mutating func drop(card: Card, at locationToGo: Location) {
        switch locationToGo {
        case .stacks(let stackIndex, _):
            if !stacksOfCards[stackIndex].isEmpty {
                let stack = stacksOfCards[stackIndex]
                let lastCard = stack[stack.endIndex - 1]
                if !userCanJoin(cards: [card, lastCard]) { return }
            }
                
            let endIndex = stacksOfCards[stackIndex].endIndex
            let newCard = Card(number: card.number, suit: card.suit, isFaceUp: true, location: .stacks(stackIndex, endIndex))
            stacksOfCards[stackIndex].append(newCard)
        default:
            print("Not Implemented yet!")
            return
        }
        
        switch card.location {
        case .stacks(let stackIndex, let cardIndex):
            stacksOfCards[stackIndex].remove(at: cardIndex!)
            for cardIndex in stacksOfCards[stackIndex].indices {
                stacksOfCards[stackIndex][cardIndex].location = .stacks(stackIndex, cardIndex)
            }
            if !stacksOfCards[stackIndex].isEmpty {
                let endIndex = stacksOfCards[stackIndex].endIndex - 1
                stacksOfCards[stackIndex][endIndex].isFaceUp = true
            }
        default:
            print("Not Implemented yet!")
            return
        }
    }
}
