//
//  CustomTableViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/19/23.
//

import Foundation

public struct CustomTableViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var tableStateKey: String
    var customTable: CustomTableComposition? = nil
}
