//
//  ForEachViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct ForEachViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var forEachKey: String = ""
    var content: InjectedView = .empty()
}
