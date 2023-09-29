//
//  NavigationStackViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation

public struct NavigationStackViewStore: Codable, Identifiable {
    public var id: String = ""
    var modifiers: [InjectedModifier]
    var root: InjectedView
}
