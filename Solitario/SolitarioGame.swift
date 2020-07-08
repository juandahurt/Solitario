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
        case stacks(Int)  // Asocia el valor del indice de la pila
    }
    
    init() {
        deckOfCards = [Card]()
        stacksOfCards = [[Card]]()
        finalStacksOfCards = [[Card]]()
        
        
        var stack = [Card]()
        stack.append(Card(id: 1, number: 1, suit: .spades))
        var stack2 = [Card]()
        stack2.append(Card(id: 2, number: 2, suit: .diamonds))
        stacksOfCards.append(stack)
        stacksOfCards.append(stack2)
    }
    
    mutating func drop(card: Card, at stackIndexWhereTheCardWantsToGo: Int, from stackIndexWhereTheCardIs: Int) {
        // TODO: Agregar la validación de las carta
        stacksOfCards[stackIndexWhereTheCardIs].removeLast()
        stacksOfCards[stackIndexWhereTheCardWantsToGo].append(card)
    }
    
    func find(card: Card) -> Int? {
        // TODO: Modificar esta busqueda. Tal vez con un atributo location en las cartas.
        //       ¡Muy poco eficiente!
        for heapIndex in 0..<stacksOfCards.count {
            for cardIndex in 0..<stacksOfCards[heapIndex].count {
                if stacksOfCards[heapIndex][cardIndex].id == card.id {
                    return heapIndex
                }
            }
        }
        return nil
    }
}
