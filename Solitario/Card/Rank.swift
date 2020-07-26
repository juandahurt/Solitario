//
//  Rank.swift
//  Solitario
//
//  Created by Negro on 25/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

struct Rank {
    private(set) var value: Int
}

extension Rank {
    static let ace = Rank(value: 1)
    static let jack = Rank(value: 11)
    static let queen = Rank(value: 12)
    static let king = Rank(value: 13)
}

extension Rank: Equatable {
    static func == (lhs: Rank, rhs: Rank) -> Bool {
        lhs.value == rhs.value
    }
    
    static func ~= (lhs: Rank, rhs: Rank) -> Bool {
        lhs == rhs
    }
}

extension Rank {
    func giveMeYourRepresentation() -> String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return "\(value)"
        }
    }
}
