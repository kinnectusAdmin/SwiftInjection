//
//  SectionViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation

public struct SectionViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var composition: SectionComposition
    var content: StackContent = StackContent()
    
    init(id: String = "", modifiers: [InjectedModifier] = [], composition: SectionComposition, content: StackContent) {
        self.id = id
        self.modifiers = modifiers
        self.composition = composition
        self.content = content
    }
}
extension SectionViewStore {
    public enum SectionComposition: Codable {
        case withTitle(titleKey: String, title: String?)
        case footer(InjectedView)
        case header(InjectedView)
        case headerFooter(InjectedView, InjectedView)
    }
}

