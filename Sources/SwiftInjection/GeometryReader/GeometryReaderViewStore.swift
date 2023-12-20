//
//  GeometryReaderViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation


public struct GeometryReaderViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    public var geometryProxyWidthKey: String
    public var geometryProxyHeightKey: String
    public var geometryProxyBottomKey: String
    public var geometryProxyLeadingKey: String
    public var geometryProxyTopKey: String
    public var geometryProxyTrailingKey: String
    public var content: InjectedView
    
    init(id: String = "", modifiers: [InjectedModifier] = [], geometryProxyWidthKey: String = "", geometryProxyHeightKey: String = "",
         geometryProxyBottomKey: String = "",
         geometryProxyLeadingKey: String = "",
         geometryProxyTopKey: String = "",
         geometryProxyTrailingKey: String, content: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.geometryProxyWidthKey = geometryProxyWidthKey
        self.geometryProxyHeightKey = geometryProxyHeightKey
        self.geometryProxyBottomKey = geometryProxyBottomKey
        self.geometryProxyLeadingKey = geometryProxyLeadingKey
        self.geometryProxyTopKey = geometryProxyTopKey
        self.geometryProxyTrailingKey = geometryProxyTrailingKey
        self.content = content
    }
}
