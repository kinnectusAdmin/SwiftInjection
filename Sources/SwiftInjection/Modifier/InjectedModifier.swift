//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

public enum InjectedModifier: Codable {
    case systemFont(font: InjectedSystemFont)
    case font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil)
    case fontWeight(weight: InjectedFontWeight)
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
    case alert(stateId: String = "", isPresentedKey: String, alertView: InjectedAlert)
    case confirmationDialog(stateId: String = "", titleKey: String, isPresentedKey: String, titleVisibility: InjectedVisbility? = nil, title: String? = nil, actions: InjectedView)
    case popover(stateId: String = "", isPresentedKey: String, popoverAttachmentAnchor: InjectedPopoverAttachmentAnchor? = nil, edge: InjectedEdge? = nil, content: InjectedView)
    case bold(stateId: String = "", isActiveKey: String = "")
    case italic(stateId: String = "", isActiveKey: String = "")
    case monoSpacedDigit
    case monospaced(stateId: String = "", isActiveKey: String = "")
    case fontDesign(design: InjectedFontDesign)
    case fontWidth(width: InjectedFontWidth)
    case spacingBetweenText(spacing: Double)
    case tracking(Double)
    case opacity(Double)
    case strikeThrough(stateId: String = "", isActiveKey: String = "", patternKey: String =  "", pattern: InjectedTextLineStylePattern? = nil, colorKey: String = "", hexColor: String = "")
    case underline(stateId: String = "", isActiveKey: String = "", patternKey: String =  "", pattern: InjectedTextLineStylePattern? = nil, colorKey: String = "", hexColor: String = "")
    case lineLimit(stateId: String = "", limitKey: String = "", limit: Int? = nil)
    case unredacted
    case truncationMode(mode: InjectedTextTruncation)
    case layoutPriority(priority: Double)
    case tag(Int)
    case blendMode(mode: InjectedBlendMode)
    case fixedSizeView
    case fixedSize(horizontal: Bool, vertical: Bool)
    case multilineTextAlignment(alignment: InjectedTextAlignment)
    case imageScale(scale: InjectedImageScale)
    case minimumScaleFactor(factor: Double)
    case animation(stateId: String = "", isActiveKey: String, animation: InjectedAnimation)
    case edgesIgnoringSafeArea(edges: InjectedEdgeSet)
    case disabled(stateId: String = "", isDisabledKey: String)
    case buttonStyle(style: InjectedButtonStyle)
    case position(stateId: String = "", xKey: String = "", yKey: String = "", x: Double? = nil, y: Double? = nil)
    case shadow(stateId: String = "", colorKey: String = "", radiusKey: String = "", xKey: String = "", yKey: String = "", colorHex: String? = nil, radius: Double? = nil, x: Double? = nil, y: Double? = nil)
    case pickerStyle(style: InjectedPickerStyle)
    case blur(stateId: String = "", radiusKey: String = "", isOpaqueKey: String = "", radius: Double? = nil, isOpaque: Bool? = nil)
    case brightness(stateId: String = "", amountKey: String = "", amount: Double? = nil)
    case textRenderingMode(InjectedSymbolRenderingMode)
    case antiAliased(stateId: String = "", isAntiAliasedKey: String = "", isAntialised: Bool? = nil)
    case resizable(capInsets: InjectedEdgeInSets? = nil, resizingMode: InjectedResizingMode? = nil)
    case imageRenderingMode(InjectedImageRenderingMode)
    case colorInvert
    case colorMultiply(stateId: String = "", colorKey: String = "", colorHex: String = "")
    case datePickerStyle(InjectdDatePickerStyle)
}
