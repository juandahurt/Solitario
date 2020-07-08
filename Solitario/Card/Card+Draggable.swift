//
//  Card+Draggable.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

protocol Draggable {
    static var typeIdentifier: String { get }
}

extension Card: Draggable {
    static var typeIdentifier: String { return "dnd.card" }
}
