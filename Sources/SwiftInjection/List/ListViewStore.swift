//
//  ListViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct ListViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var listKey: String
    var content: InjectedView
    init(id: String = "", modifiers: [InjectedModifier] = [], listKey: String = "", content: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.listKey = listKey
        self.content = content
    }
    
}
