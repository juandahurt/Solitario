//
//  Array+RemoveLast.swift
//  Solitario
//
//  Created by Negro on 8/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeLast() {
        self.remove(at: endIndex - 1)
    }
}
