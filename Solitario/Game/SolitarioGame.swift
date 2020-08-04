//
//  SolitarioGame.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct SolitarioGame {
    var deckOfCards: [Card]
    var stacksOfCards: [[Card]]
    var aceStacksOfCards: [[Card]?]  // Aquí es donde el usuario apilará las cartas para poder ganar
    var score: Int = 0
    var moves: Int = 0
    
    enum Location: Equatable {
        case unknown
        case deck
        case stacks(Int, Int?)  // Asocia el indice de la pila y el indice dentro de la pila
        case aceStacks(Int)  // Asocia el indice de la pila de aces
    }
    
    init() {
        deckOfCards = [Card]()
        stacksOfCards = [[Card]]()
        aceStacksOfCards = [[Card]?](repeating: nil, count: 4)
        
        let suits: [Suit] = [.clubs, .diamonds, .hearts, .spades]
        
        for suit in suits {
            for cardNumber in 1...13 {
                deckOfCards.append(Card(rank: cardNumber, suit: suit, location: .deck))
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
        
        return inititalCard.rank.value == finalCard.rank.value - 1 && inititalCard.suit.color != finalCard.suit.color
    }
    
    mutating func touchDeck() {
        moves += 1
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
            let newCard = Card(rank: card.rank.value, suit: card.suit, isFaceUp: true, location: .stacks(stackIndex, endIndex))
            stacksOfCards[stackIndex].append(newCard)
            score += 5
        case .aceStacks(let aceStackIndex):
            if let aceStack = aceStacksOfCards[aceStackIndex] {
                let cardOnTop = aceStack[aceStack.endIndex - 1]
                if cardOnTop.suit != card.suit { return }
                if cardOnTop.rank.value < card.rank.value - 1 { return }
                aceStacksOfCards[aceStackIndex]!.append(card)
                
                let endIndex = aceStacksOfCards[aceStackIndex]!.endIndex - 1
                aceStacksOfCards[aceStackIndex]![endIndex].location = .aceStacks(aceStackIndex)
            } else {
                // La pila está vacía
                if card.rank != .ace { return }
                aceStacksOfCards[aceStackIndex] = [card]
                aceStacksOfCards[aceStackIndex]![0].location = .aceStacks(aceStackIndex)
            }
            score += 10
        default:
            print("wtf?")  // Si llega aquí, me corto un huevo
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
                // TODO: Hacer funcionar el reproductor de sonidos
            }
        case .deck:
            // TODO: Validar que sea la última carta del mazo, ahora cómo vergas se hace eso
            if let cardIndex = deckOfCards.firstIndex(where: { $0.rank == card.rank && $0.suit == card.suit }) {
                deckOfCards.remove(at: cardIndex)
            }
        case .aceStacks(let aceStackIndex):
            aceStacksOfCards[aceStackIndex]!.removeLast()
        default:
            print("Not Implemented yet!")
        }
        moves += 1
    }
}
