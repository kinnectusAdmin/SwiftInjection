//
//  ListViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct ListViewStore: Codable, Identifiable {
    public var id: String = ""
    var modifiers: [InjectedModifier] = []
    var listKey: String = ""
    var content: InjectedView = .empty()
}
