//
//  FieldViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct FieldViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var textKey: String
    var content: InjectedView
    
    init(id: String = "", modifiers: [InjectedModifier] = [], textKey: String = "", content: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.textKey = textKey
        self.content = content
    }
}
