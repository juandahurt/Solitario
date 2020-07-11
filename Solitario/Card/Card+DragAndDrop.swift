//
//  Card+DragAndDrop.swift
//  Solitario
//
//  Created by Negro on 7/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation

extension Card: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] = [typeIdentifier]
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler("\(self.id),\(self.number),\(self.suit.symbol)".data(using: .utf8), nil)
        let p = Progress(totalUnitCount: 1)
        p.completedUnitCount = 1
        return p
    }
}

extension Card: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] = [typeIdentifier]
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Card {
        let components = String(data: data, encoding: .utf8)!.split(separator: ",")
        return Card(id: Int(components[0])!, number: Int(components[1])!, suit: Suit.from(string: String(components[2]))!)
    }
}
