//
//  GridViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation

public struct GridViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var alignment: InjectedAlignment? = nil
    var horizontalSpacing: Double? = nil
    var verticalSpacing: Double? = nil
    var content1: InjectedView = .empty()
    var content2: InjectedView? = nil
    var content3: InjectedView? = nil
    var content4: InjectedView? = nil
    var content5: InjectedView? = nil
    var content6: InjectedView? = nil
    var content7: InjectedView? = nil
    var content8: InjectedView? = nil
    var content9: InjectedView? = nil
    var content10: InjectedView? = nil
}
