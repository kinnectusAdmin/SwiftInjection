//
//  NavigationStackViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation

public struct NavigationStackViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var root: InjectedView
    
    init(id: String = "", modifiers: [InjectedModifier] = [], root: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.root = root
    }
}
