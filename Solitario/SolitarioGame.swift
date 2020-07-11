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
            for cardIndex in 2..<5 {
                let randomIndex = Int.random(in: 0..<deckOfCards.count)
                var card = deckOfCards.remove(at: randomIndex)
                card.location = .stacks(stackIndex, cardIndex - 2)
                stack.append(card)
            }
            stacksOfCards.append(stack)
        }
    }
    
    mutating func drop(card: Card, at locationToGo: Location) {
        // TODO: Agregar la validación de las cartas
        switch card.location {
        case .stacks(let stackIndex, let cardIndex):
            stacksOfCards[stackIndex].remove(at: cardIndex!)
            for cardIndex in stacksOfCards[stackIndex].indices {
                stacksOfCards[stackIndex][cardIndex].location = .stacks(stackIndex, cardIndex)
            }
        default:
            print("Not Implemented yet!")
        }
        
        switch locationToGo {
        case .stacks(let stackIndex, _):
            let newCard = Card(number: card.number, suit: card.suit, isFaceUp: true, location: .stacks(stackIndex, stacksOfCards[stackIndex].endIndex))
            stacksOfCards[stackIndex].append(newCard)
        default:
            print("Not Implemented yet!")
        }
//        stacksOfCards[card.location.0].remove(at: card.location)
    }
}
