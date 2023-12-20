//
//  FormViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation

public struct FormViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var content: StackContent = StackContent()
}
