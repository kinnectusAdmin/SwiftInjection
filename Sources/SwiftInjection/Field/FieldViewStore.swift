//
//  FieldViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct FieldViewStore: Codable, Identifiable {
    public var id: String = ""
    var modifiers: [InjectedModifier] = []
    var textKey: String = ""
    var content: InjectedView = .empty()
}
