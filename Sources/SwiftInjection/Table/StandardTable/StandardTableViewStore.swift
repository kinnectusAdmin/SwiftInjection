//
//  StandardTableViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation

public struct StandardTableViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var tableStateKey: String
    var standardTable: StandardTableComposition? = nil
}
