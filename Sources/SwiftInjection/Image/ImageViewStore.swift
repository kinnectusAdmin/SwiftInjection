//
//  ImageViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct ImageViewStore: Codable, Identifiable {
    public var id: String = ""
    var nameKey: String? = nil
    var name: String? = nil
    var systemNameKey: String? = nil
    var systemName: String? = nil
    var urlKey: String? = nil
    var url: String? = nil
    var scaleKey: String? = nil
    var scale: Double = 1
    var placeholder: InjectedView? = nil
    var modifiers: [InjectedModifier] = []
}

