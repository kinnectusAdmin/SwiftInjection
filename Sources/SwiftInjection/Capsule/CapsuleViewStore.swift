//
//  CapsuleViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

public struct CapsuleViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var style: InjectedRoundedCornerStyle? = nil
}
