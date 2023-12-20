//
//  NavigationLinkViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation

public struct NavigationLinkViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var destination: InjectedView
    var label: InjectedView
    
    init(id: String = "", modifiers: [InjectedModifier] = [], destination: InjectedView, label: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.destination = destination
        self.label = label
    }
    
}

