//
//  ScrollViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation

public struct ScrollViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var axes: InjectedAxes = .vertical
    var showsIndicators: Bool = false
    var content: StackContent = StackContent()
}
