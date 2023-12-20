//
//  ForEachViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct ForEachViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var forEachKey: String
    var content: InjectedView
    
    init(id: String = "", modifiers: [InjectedModifier] = [], forEachKey: String = "", content: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.forEachKey = forEachKey
        self.content = content
    }
}
