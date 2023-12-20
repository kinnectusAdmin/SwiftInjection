//
//  CapsuleViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

public struct CapsuleViewStore: Codable {
    public static func ==(lhs: CapsuleViewStore, rhs: CapsuleViewStore) -> Bool {
        lhs.id == rhs.id
    }
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var style: InjectedRoundedCornerStyle? = nil
}
