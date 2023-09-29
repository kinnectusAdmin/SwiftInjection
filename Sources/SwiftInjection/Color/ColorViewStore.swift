//
//  ColorViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct ColorViewStore: Codable, Identifiable {
    public var id: String = ""
    var modifiers: [InjectedModifier] = []
    var colorKey: String = ""
}
