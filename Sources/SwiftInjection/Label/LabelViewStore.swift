//
// LabelViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/2/23.
//

import Foundation

public struct LabelViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier] = []
    var titleKey: String
    var imageKey: String
    var systemImageKey: String
    var title: String?
    var image: String?
    var systemImage: String?
    var titleView: InjectedView?
    var iconView: InjectedView?
    
    init(id: String = "", modifiers: [InjectedModifier] = [], titleKey: String = "", imageKey: String = "", systemImageKey: String = "", title: String? = nil, image: String? = nil, systemImage: String? = nil, iconView: InjectedView?, titleView: InjectedView?) {
        self.id = id
        self.titleKey = titleKey
        self.imageKey = imageKey
        self.systemImageKey = systemImageKey
        self.iconView = iconView
        self.titleView = titleView
        self.title = title
        self.image = image
        self.systemImage = systemImage
    }
}
