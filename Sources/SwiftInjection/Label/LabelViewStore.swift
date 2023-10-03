//
// LabelViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/2/23.
//

import Foundation

public struct LabelViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier]
    var titleKey: String = ""
    var imageKey: String = ""
    var systemImageKey: String = ""
    var titleView: InjectedView? = nil
    var iconView: InjectedView? = nil
    var title: String? = nil
    var image: String? = nil
    var systemImage: String? = nil
}
