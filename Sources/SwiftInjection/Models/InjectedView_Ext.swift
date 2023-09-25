//
//  InjectedView_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/15/23.
//

import Foundation

public extension InjectedView {
    
    func systemFont(font: InjectedSystemFont) -> InjectedView {
        self.addModifier(modifier: .systemFont(font: font))
    }
    func font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .font(stateId: stateId, nameId: nameId, sizeId: sizeId, fontName: fontName, fontSize: fontSize))
    }
    func fontWeight(weight: InjectedFontWeight) -> InjectedView {
        self.addModifier(modifier: .fontWeight(weight: weight))
    }
    func width(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .width(stateId: stateId, widthId: widthId, width: width))
    }
    func height(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .height(stateId: stateId, heightId: heightId, height: height))
    }
    func minWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .minWidth(stateId: stateId, widthId: widthId, width: width))
    }
    func maxWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .maxWidth(stateId: stateId, widthId: widthId, width: width))
    }
    func minHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .minHeight(stateId: stateId, heightId: heightId, height: height))
    }
    func maxHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .maxHeight(stateId: stateId, heightId: heightId, height: height))
    }
    func idealWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .idealWidth(stateId: stateId, widthId: widthId, width: width))
    }
    func idealHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .idealHeight(stateId: stateId, heightId: heightId, height: height))
    }
    func alignment(stateId: String = "", alignmentId: String = "", alignment: ZStackAlignment? = nil) -> InjectedView {
        self.addModifier(modifier: .alignment(stateId: stateId, alignmentId: alignmentId, alignment: alignment))
    }
    func padding(stateId: String = "", edgeSetId: String = "", lengthId: String = "", edgeSet: InjectedEdgeSet? = nil, length: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .padding(stateId: stateId, edgeSetId: edgeSetId, lengthId: lengthId, edgeSet: edgeSet, length: length))
    }
    func cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .cornerRadius(stateId: stateId, valueId: valueId, radius: radius))
    }
    
    func borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil) -> InjectedView {
        self.addModifier(modifier: .borderline(stateId: stateId, widthId: widthId, colorId: colorId, width: width, colorHex: colorHex))
    }
    
    func foregroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil) -> InjectedView {
        self.addModifier(modifier: .foregroundColor(stateId: stateId, valueId: valueId, colorHex: colorHex))
    }
    
    func background(content: InjectedView, alignment: ZStackAlignment? = nil) -> InjectedView {
        self.addModifier(modifier: .background(content: content, alignment: alignment))
    }
    
    func fullScreenCover(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifier(modifier: .fullScreenCover(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
    
    func sheet(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifier(modifier: .sheet(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
    func bold(stateId: String = "", isActiveKey: String = "") -> InjectedView {
        addModifier(modifier: .bold(stateId: stateId, isActiveKey: isActiveKey))
    }
    func italic(stateId: String = "", isActiveKey: String = "") -> InjectedView {
        addModifier(modifier: .italic(stateId: stateId, isActiveKey: isActiveKey))
    }
    func monoSpacedDigit() -> InjectedView {
        addModifier(modifier: .monoSpacedDigit)
    }
    func monospaced(stateId: String = "", isActiveKey: String = "") -> InjectedView {
        addModifier(modifier: .monospaced(stateId: stateId, isActiveKey: isActiveKey))
    }
    func fontDesign(design: InjectedFontDesign) -> InjectedView {
        addModifier(modifier: .fontDesign(design: design))
    }
    func fontWidth(width: InjectedFontWidth) -> InjectedView {
        addModifier(modifier: .fontWidth(width: width))
    }
    func spacingBetweenText(spacing: Double) -> InjectedView {
        addModifier(modifier: .spacingBetweenText(spacing: spacing))
    }
    func tracking(tracking: Double) -> InjectedView {
        addModifier(modifier: .tracking(tracking))
    }
    func opacity(opacity: Double) -> InjectedView {
        addModifier(modifier: .opacity(opacity))
    }
    func strikeThrough(stateId: String = "", isActiveKey: String = "", patternKey: String =  "", pattern: InjectedTextLineStylePattern? = nil, colorKey: String = "", hexColor: String = "") -> InjectedView {
        addModifier(modifier: .strikeThrough(stateId: stateId, isActiveKey: isActiveKey, patternKey: patternKey, pattern: pattern, colorKey: colorKey, hexColor: hexColor))
    }
    func underline(stateId: String = "", isActiveKey: String = "", patternKey: String =  "", pattern: InjectedTextLineStylePattern? = nil, colorKey: String = "", hexColor: String = "") -> InjectedView {
        addModifier(modifier: .underline(stateId: stateId, isActiveKey: isActiveKey, patternKey: patternKey, pattern: pattern, colorKey: colorKey, hexColor: hexColor))
    }
    func lineLimit(stateId: String = "", limitKey: String = "", limit: Int? = nil) -> InjectedView {
        addModifier(modifier: .lineLimit(stateId: stateId, limitKey: limitKey, limit: limit))
    }
    func unredacted() -> InjectedView {
        addModifier(modifier: .unredacted)
    }
    func truncationMode(mode: InjectedTextTruncation) -> InjectedView {
        addModifier(modifier: .truncationMode(mode: mode))
    }
    func layoutPriority(priority: Double) -> InjectedView {
        addModifier(modifier: .layoutPriority(priority: priority))
    }
    func tag(tag: Int) -> InjectedView {
        addModifier(modifier: .tag(tag))
    }
    func blendMode(mode: InjectedBlendMode) -> InjectedView {
        addModifier(modifier: .blendMode(mode: mode))
    }
    func fixedSizeView() -> InjectedView {
        addModifier(modifier: .fixedSizeView)
    }
    func fixedSize(horizontal: Bool, vertical: Bool) -> InjectedView {
        addModifier(modifier: .fixedSize(horizontal: horizontal, vertical: vertical))
    }
    func multilineTextAlignment(alignment: InjectedTextAlignment) -> InjectedView {
        addModifier(modifier: .multilineTextAlignment(alignment: alignment))
    }
    func imageScale(scale: InjectedImageScale) -> InjectedView {
        addModifier(modifier: .imageScale(scale: scale))
    }
    func minimumScaleFactor(factor: Double) -> InjectedView {
        addModifier(modifier: .minimumScaleFactor(factor: factor))
    }
    func animation(stateId: String = "", isActiveKey: String, animation: InjectedAnimation) -> InjectedView {
        addModifier(modifier: .animation(stateId: stateId, isActiveKey: isActiveKey, animation: animation))
    }
    func edgesIgnoringSafeArea(edges: InjectedEdgeSet) -> InjectedView {
        addModifier(modifier: .edgesIgnoringSafeArea(edges: edges))
    }
    func disabled(stateId: String = "", isDisabledKey: String) -> InjectedView {
        addModifier(modifier: .disabled(stateId: stateId, isDisabledKey: isDisabledKey))
    }
    func buttonStyle(style: InjectedButtonStyle) -> InjectedView {
        addModifier(modifier: .buttonStyle(style: style))
    }
    func position(stateId: String = "", xKey: String = "", yKey: String = "", x: Double? = nil, y: Double? = nil) -> InjectedView {
        addModifier(modifier: .position(stateId: stateId, xKey: xKey, yKey: yKey, x: x, y: y))
    }
    func shadow(stateId: String = "", colorKey: String = "", radiusKey: String = "", xKey: String = "", yKey: String = "", colorHex: String? = nil, radius: Double? = nil, x: Double? = nil, y: Double? = nil) -> InjectedView {
        addModifier(modifier: .shadow(stateId: stateId, colorKey: colorKey, radiusKey: radiusKey, xKey: xKey, yKey: yKey, colorHex: colorHex, radius: radius, x: x, y: y))
    }
    func pickerStyle(style: InjectedPickerStyle) -> InjectedView {
        addModifier(modifier: .pickerStyle(style: style))
    }
    func blur(stateId: String = "", radiusKey: String = "", isOpaqueKey: String = "", radius: Double? = nil, isOpaque: Bool? = nil) -> InjectedView {
        addModifier(modifier: .blur(stateId: stateId, radiusKey: radiusKey, isOpaqueKey: isOpaqueKey, radius: radius, isOpaque: isOpaque))
    }
    func brightness(stateId: String = "", amountKey: String = "", amount: Double? = nil) -> InjectedView {
        addModifier(modifier: .brightness(stateId: stateId, amountKey: amountKey, amount: amount))
    }
    func textRenderingMode(mode: InjectedSymbolRenderingMode) -> InjectedView {
        addModifier(modifier: .textRenderingMode(mode))
    }
    func antiAliased(stateId: String = "", isAntiAliasedKey: String = "", isAntialised: Bool? = nil) -> InjectedView {
        addModifier(modifier: .antiAliased(stateId: stateId, isAntiAliasedKey: isAntiAliasedKey, isAntialised: isAntialised))
    }
    func resizable(capInsets: InjectedEdgeInSets? = nil, resizingMode: InjectedResizingMode? = nil) -> InjectedView {
        addModifier(modifier: .resizable(capInsets: capInsets, resizingMode: resizingMode))
    }
    func imageRenderingMode(mode: InjectedImageRenderingMode) -> InjectedView {
        addModifier(modifier: .imageRenderingMode(mode))
    }
    func colorInvert() -> InjectedView {
        addModifier(modifier: .colorInvert)
    }
    func colorMultiply(stateId: String = "", colorKey: String = "", colorHex: String = "") -> InjectedView {
        addModifier(modifier: .colorMultiply(stateId: stateId, colorKey: colorKey, colorHex: colorHex))
    }
    func datePickerStyle(style: InjectdDatePickerStyle) -> InjectedView {
        addModifier(modifier: .datePickerStyle(style))
    }
}
