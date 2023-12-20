//
//  ControlGroupViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/22/23.
//

import Foundation

public struct ControlGroupViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier]
    let composition: ControlGroupComposition
    let content: StackContent
    init(id: String = "", modifiers: [InjectedModifier] = [], composition: ControlGroupComposition = .standard, content: StackContent) {
        self.id = id
        self.modifiers = modifiers
        self.composition = composition
        self.content = content
    }
}
extension ControlGroupViewStore {
   public enum ControlGroupComposition: Codable {
        case standard
        case withLabel(InjectedView)
//        case withConfiguration(InjectedControlGroupStyleConfiguration)
    }
}
public enum InjectedControlGroupStyleConfiguration: Codable {
    case none
//    var render: ControlGroupStyleConfiguration {
//
//    }
}
