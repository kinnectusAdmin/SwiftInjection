//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

public enum InjectedModifier: Codable {
    case systemFont(stateId: String = "", nameId: String = "", description: String = "")
    case font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil)
    case width(stateId: String = "", widthId: String = "", width: Double? = nil)
    case height(stateId: String = "", heightId: String = "", height: Double? = nil)
    case minWidth(stateId: String = "", widthId: String = "", width: Double? = nil)
    case maxWidth(stateId: String = "", widthId: String = "", width: Double? = nil)
    case minHeight(stateId: String = "", heightId: String = "", height: Double? = nil)
    case maxHeight(stateId: String = "", heightId: String = "", height: Double? = nil)
    case idealWidth(stateId: String = "", widthId: String = "", width: Double? = nil)
    case idealHeight(stateId: String = "", heightId: String = "", height: Double? = nil)
    case alignment(stateId: String = "", alignmentId: String = "", alignment: ZStackAlignment? = nil)
    case padding(stateId: String = "", edgeSetId: String = "", lengthId: String = "", edgeSet: InjectedEdgeSet? = nil, length: Double? = nil)
    case cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil)
    case borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil)
    case foregroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil)
    case background(content: InjectedView, alignment: ZStackAlignment? = nil)
    case fullScreenCover(stateId: String = "", viewStore: InjectedView, isPresentedKey: String)
    case sheet(stateId: String = "", viewStore: InjectedView, isPresentedKey: String)
}
