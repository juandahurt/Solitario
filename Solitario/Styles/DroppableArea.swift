////
////  DropableArea.swift
////  Solitario
////
////  Created by Negro on 7/07/20.
////  Copyright © 2020 Negro. All rights reserved.
////
//
//import SwiftUI
//
//struct DroppableArea<Content>: View where Content: View {
//    var objectType: Draggable.Type
//    var content: () -> Content
//    var action: (_ object: NSItemProviderReading?) -> Void
//    
//    init(of objectType: Draggable.Type, onDropPerform action: @escaping (_ object: NSItemProviderReading?) -> Void, content: @escaping () -> Content) {
//        self.objectType = objectType
//        self.action = action
//        self.content = content
//    }
//    
//    var body: some View {
//        self.content()
//            .onDrop(of: [objectType.typeIdentifier], isTargeted: nil) { ips in
//                guard let ip = ips.first(where: { ip in
//                    ip.hasItemConformingToTypeIdentifier(self.objectType.typeIdentifier)
//                }) else { return false }
//                
//                ip.loadObject(ofClass: self.objectType as! NSItemProviderReading.Type) { objectRead, _ in
//                    DispatchQueue.main.async {
//                        self.action(objectRead)
//                    }
//                }
//                return true
//            }
//    }
//}
