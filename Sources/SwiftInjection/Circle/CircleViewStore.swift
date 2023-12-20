//
//  CircleViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation

public struct CircleViewStore: Codable {
    public static func ==(lhs: CircleViewStore, rhs: CircleViewStore) -> Bool {
        lhs.id == rhs.id
    }
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
}
