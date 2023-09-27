//
//  NavigationLinkViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation

public struct NavigationLinkViewStore: Codable {
    var id: String
    var modifiers: [InjectedModifier]
    var destination: InjectedView
    var label: InjectedView
}

