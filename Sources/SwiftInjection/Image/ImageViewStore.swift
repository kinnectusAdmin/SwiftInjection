//
//  ImageViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct ImageViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var nameKey: String?
    var name: String?
    var systemNameKey: String?
    var systemName: String?
    var urlKey: String?
    var url: String?
    var scaleKey: String?
    var scale: Double
    var placeholder: InjectedView?
    init(id: String = "", modifiers: [InjectedModifier] = [], nameKey: String? = nil, name: String? = nil, systemNameKey: String? = nil, systemName: String? = nil, urlKey: String? = nil, url: String? = nil, scaleKey: String? = nil, scale: Double = 1, placeholder: InjectedView? = nil) {
        self.id = id
        self.modifiers = modifiers
        self.nameKey = nameKey
        self.name = name
        self.systemNameKey = systemNameKey
        self.systemName = systemName
        self.urlKey = urlKey
        self.url = url
        self.scaleKey = scaleKey
        self.scale = scale
        self.placeholder = placeholder
    }
}
