//
//  RoundedRectangleViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

public struct RoundedRectangleViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var cornerRadiusKey: String = ""
    var widthKey: String = ""
    var heightKey: String = ""
    var cornerRadius: Double? = nil
    var width: Double? = nil
    var height: Double? = nil
    var style: InjectedRoundedCornerStyle? = nil
}
