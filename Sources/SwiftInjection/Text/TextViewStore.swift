//
//  TextViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct TextViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var textKey: String = ""
}
