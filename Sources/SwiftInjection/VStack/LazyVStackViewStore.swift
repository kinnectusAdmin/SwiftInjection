//
//  LazyVStackViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/19/23.
//

import Foundation

public struct LazyVStackViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var alignmentKey: String
    var spacingKey: String
    var content1: InjectedView
    var content2: InjectedView?
    var content3: InjectedView?
    var content4: InjectedView?
    var content5: InjectedView?
    var content6: InjectedView?
    var content7: InjectedView?
    var content8: InjectedView?
    var content9: InjectedView?
    var content10: InjectedView?
    
    init(id: String = "", modifiers: [InjectedModifier] = [], alignmentKey: String = "", spacingKey: String = "", content1: InjectedView, content2: InjectedView? = nil, content3: InjectedView? = nil, content4: InjectedView? = nil, content5: InjectedView? = nil, content6: InjectedView? = nil, content7: InjectedView? = nil, content8: InjectedView? = nil, content9: InjectedView? = nil, content10: InjectedView? = nil) {
        self.id = id
        self.modifiers = modifiers
        self.alignmentKey = alignmentKey
        self.spacingKey = spacingKey
        self.content1 = content1
        self.content2 = content2
        self.content3 = content3
        self.content4 = content4
        self.content5 = content5
        self.content6 = content6
        self.content7 = content6
        self.content8 = content8
        self.content9 = content9
        self.content10 = content10
    }
}