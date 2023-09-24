//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
    
public enum InjectedFontDesign: String, Codable  {
    case none
    var render: Font.Design {
        return .default
    }
}
public enum InjectedFontWidth: String, Codable {
    case none
    var render: Font.Width {
        return .compressed
    }
}
public enum InjectedTextLineStylePattern: String, Codable {
    case none
    var render: Text.LineStyle.Pattern {
        return .dash
    }
}
public enum InjectedTextTruncation: String, Codable {
    case none
    var render: Text.TruncationMode {
        return .head
    }
}
public enum InjectedBlendMode: String, Codable {
    case  none
    var render: BlendMode {
        .color
    }
}
public enum InjectedTextAlignment: String, Codable {
    case none
    var render: TextAlignment {
        .center
    }
}
public enum InjectedImageScale: String, Codable {
    case none
    var render: Image.Scale {
        .medium
    }
}
public enum InjectedAnimation: String, Codable {
    case none
    var render: Animation {
        return .default
    }
}
public enum InjectedButtonStyle: String, Codable {
    case none
}
public enum InjectedProgressViewStyle: String, Codable {
    case none
}
public enum InjectedPickerStyle: String, Codable {
    case none
}
public enum InjectedSymbolRenderingMode: String, Codable {
    case none
}
public enum InjectedResizingMode: String, Codable {
    case none
}
public enum InjectedImageRenderingMode: String, Codable {
    case none
}
public enum InjectdDatePickerStyle: String, Codable {
    case none
}
    
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
    case lineLimit(lowerRange: Int, upperRange: Int)
    case unredacted
    case truncationMode(mode: InjectedTextTruncation)
    case layoutPriority(priority: Double)
    case tag(Int)
    case blendMode(mode: InjectedBlendMode)
    case fixedSize(horizontal: Bool, vertical: Bool)
    case multilineTextAlignment(alignment: InjectedTextAlignment)
    case imageScale(scale: InjectedImageScale)
    case minimumScaleFactor(factor: Double)
    case animation(InjectedAnimation)
    case animationWithValue(animation: InjectedAnimation, valueKey: String)
    case edgesIgnoringSafeArea(edges: InjectedEdgeSet)
    case disabled(stateId: String = "", isDisabledKey: String)
    case buttonStyle(style: InjectedButtonStyle)
    case position(x: Double, y: Double)
    case shadow(stateId: String = "", colorKey: String = "", radiusKey: String = "", xKey: String = "", yKey: String = "", colorHex: String = "", radius: Double? = nil, x: Double? = nil, y: Double? = nil)
    case pickerStyle(style: InjectedPickerStyle)
    case blur(stateId: String = "", radiusKey: String = "", isOpaqueKey: String = "", radius: Double, isOpaque: Bool)
    case brightness(stateId: String = "", amountKey: String = "", amount: Double)
    case textRenderingMode(InjectedSymbolRenderingMode)
    case antiAliased(stateId: String = "", isAntiAliasedKey: String = "", isAntialised: Bool)
    case resizingable(capInsets: InjectedEdgeSet, resizingMode: InjectedResizingMode)
    case imageRenderingMode(InjectedImageRenderingMode)
    case colorInvert
    case colorMultiply(stateId: String = "", colorKey: String = "", colorHex: String = "")
    case datePickerStyle(InjectdDatePickerStyle)
}
