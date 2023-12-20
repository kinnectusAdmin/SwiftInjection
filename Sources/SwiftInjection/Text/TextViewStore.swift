//
//  TextViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct TextViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var textKey: String = ""
    var text: String? = nil
}
