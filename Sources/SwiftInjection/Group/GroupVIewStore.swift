//
//  GroupViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/22/23.
//

import Foundation

public struct GroupViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var content: StackContent
    
    init(id: String = "", modifiers: [InjectedModifier] = [], content: StackContent = StackContent()) {
        self.id = id
        self.modifiers = modifiers
        self.content = content
    }
    
}
