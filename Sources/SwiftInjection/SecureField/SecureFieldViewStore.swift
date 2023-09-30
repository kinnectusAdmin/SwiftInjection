//
//  SecureFieldViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/29/23.
//

import Foundation

public struct SecureFieldViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier]
    var titleKey: String? = nil
    var title: String = ""
    var textKey: String = ""
    var promptKey: String? = nil
    var prompt: String = ""
}
