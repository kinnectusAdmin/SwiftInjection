//
//  InjectedModifier_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
import SwiftUI
import Combine

public extension View {
    
    func addModifier(modifier: InjectedModifier, state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        switch modifier {
        case .systemFont(let injectedSystemFont):
            return AnyView(
                self.font(injectedSystemFont.font)
            )
        case let .font(stateId, nameId, sizeId, fontName, fontSize):
            //Route state value using statedi and id
            if let fontName = findStringValue(stateId: stateId, id: nameId, state: state.value), let fontSize = findDoubleValue(stateId: stateId, id: sizeId, state: state.value) {
                return AnyView(
                    self.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else if let fontName = fontName, let fontSize = fontSize {
                return AnyView(
                    self.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else {
                return AnyView(self)
            }
        case .fontWeight(let weight):
            return AnyView(
                self.fontWeight(weight.render)
            )
        case let .width(stateId, widthId, width):
            //Route state value using statedi and id
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    self.frame(width: width)
                )
            } else if let width = width {
                return AnyView(
                    self.frame(width: width)
                )
            } else {
                return AnyView(self)
            }
        case let .height(stateId, heightId, height):
            //Route state value using statedi and id
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    self.frame( height: height)
                )
            } else if let height = height {
                return AnyView(
                    self.frame(height: height)
                )
            } else {
                return AnyView(self)
            }
        
        case let .foregroundColor(stateId, id, hex):
            if let hexValue = findStringValue(stateId: stateId, id: id, state: state.value) {
                return AnyView(
                    self.foregroundColor(Color(UIColor.hex(hexValue)))
                )
            } else if let hex = hex {
                return AnyView(
                    self.foregroundColor(Color(UIColor.hex(hex)))
                )
            } else {
                return AnyView(self)
            }
        case let .background(viewStore, alignment):
                return AnyView(
                    self.background(Insertable(state: state, container: container, viewStore: viewStore), alignment: (alignment ?? .center).render)
                )
        case let .fullScreenCover(stateId, viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                return AnyView(
                    self.fullScreenCover(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(self)
            }
        case let .sheet(stateId, viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                return AnyView(
                    self.sheet(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(self)
            }
        case let .alert(stateId, isPresentedKey, alertView):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                switch alertView {
                case let .dismissAlert(store):
                    return AnyView(self.alert(isPresented: .constant(isPresented), content: {
                        DismissAlertView(viewStore: store, state: state, container: container).render
                    }))
                case let .primarySecondaryAlert(store):
                    return AnyView(self.alert(isPresented: .constant(isPresented), content: {
                        PrimarySecondaryAlertView(viewStore: store, state: state, container: container).render
                    }))
                }
            } else {
                return AnyView(self)
            }
        case let .cornerRadius(stateId, valueId, radius):
            //Route state value using statedi and id
            if let radiusValue = findDoubleValue(stateId: stateId, id: valueId, state: state.value) {
                return AnyView(
                    self.cornerRadius(CGFloat(radiusValue))
                )
            } else if let radius = radius {
                return AnyView(
                    self.cornerRadius(CGFloat(radius))
                )
            } else {
                return AnyView(self)
            }
        case let .borderline(stateId, widthId, colorId, width, color):
            if let widthValue = findDoubleValue(stateId: stateId, id: widthId, state: state.value), let colorValue = findStringValue(stateId: stateId, id: colorId, state: state.value) {
                return AnyView(
                    self.border(Color(UIColor.hex(colorValue)), width: CGFloat(widthValue))
                )
            } else if let width = width, let color = color {
                return AnyView(
                    self.border(Color(UIColor.hex(color)), width: CGFloat(width))
                )
            } else {
                return AnyView(self)
            }
        case let .minWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    self.frame(minWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(minWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .maxWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    self.frame(maxWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(maxWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
            
        case let .minHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    self.frame(minHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(minHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .maxHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    self.frame(maxHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(maxHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
            
        case let .idealWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    self.frame(idealWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(idealWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .idealHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    self.frame(idealHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(idealHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .alignment(stateId, alignmentId, alignment):
            if let alignment = findValue(type: ZStackAlignment.self, stateId: stateId, id: alignmentId, state: state.value) {
                return AnyView(
                    self.frame(alignment: alignment.render)
                )
            } else if let alignment = alignment {
                return AnyView(
                    self.frame(alignment: alignment.render)
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .padding(stateId, edgeSetId, lengthId, edgeSet, length):
            if let edgeSet = findValue(type: InjectedEdgeSet.self, stateId: stateId, id: edgeSetId, state: state.value){
                return AnyView(
                    self.padding(edgeSet.render, CGFloat(findDoubleValue(stateId: stateId, id: lengthId, state: state.value) ?? 10))
                )
            } else if let edgeSet = edgeSet {
                return AnyView(
                    self.padding(edgeSet.render, CGFloat(length ?? 10))
                )
            } else {
                return AnyView(self)
            }
        case let .bold(stateId, isActiveKey):
            if let isBold = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(self.bold(isBold))
            } else {
                return AnyView(self.bold())
            }
        case let .italic(stateId, isActiveKey):
            if let isItalicized = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(self.italic(isItalicized))
            } else {
                return AnyView(self.italic())
            }
        case .monoSpacedDigit:
            return AnyView(self.monospacedDigit())
        case let .monospaced(stateId, isActiveKey):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(self.monospaced(isActive))
            } else {
                return AnyView(self.monospaced())
            }
        case let .fontDesign(design):
            if #available(iOS 16.1, *) {
                return AnyView(self.fontDesign(design.render))
            } else {
                // Fallback on earlier versions
                return AnyView(self)
            }
        case let .fontWidth(width):
            return AnyView(self.fontWidth(width.render))
        case let .spacingBetweenText(spacing):
            return AnyView(self.kerning(CGFloat(spacing)))
        case let .tracking(tracking):
            return AnyView(self.tracking(CGFloat(tracking)))
        case let .opacity(opacity):
            return AnyView(self.opacity(CGFloat(opacity)))
        case let .strikeThrough(stateId, isActiveKey, patternKey, pattern, colorKey, hexColor):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value), let pattern = findValue(type: InjectedTextLineStylePattern.self, stateId: stateId, id: patternKey, state: state.value), let hexColor = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(
                    self.strikethrough(isActive, pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else if let pattern = pattern, !hexColor.isEmpty{
                return AnyView(
                    self.strikethrough(pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else {
                return AnyView(self.strikethrough())
            }
        case let .underline(stateId, isActiveKey, patternKey, pattern, colorKey, hexColor):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value), let pattern = findValue(type: InjectedTextLineStylePattern.self, stateId: stateId, id: patternKey, state: state.value), let hexColor = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(
                    self.underline(isActive, pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else if let pattern = pattern, !hexColor.isEmpty{
                return AnyView(
                    self.underline(pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else {
                return AnyView(self.underline())
            }
        case let .lineLimit(stateId, limitKey, limit):
            if let limit = findIntegerValue(stateId: stateId, id: limitKey, state: state.value) {
                return AnyView(self.lineLimit(limit))
            } else if let limit = limit {
                return AnyView(self.lineLimit(limit))
            } else {
                return AnyView(self)
            }
        case .unredacted:
            return AnyView(self.unredacted())
        case let .truncationMode(mode):
            return AnyView(self.truncationMode(mode.render))
        case let .layoutPriority(priority):
            return AnyView(self.layoutPriority(priority))
        case let .tag(tag):
            return AnyView(self.tag(tag))
        case let .blendMode(injectedBlendMode):
            return AnyView(self.blendMode(injectedBlendMode.render))
        case let .fixedSize(isFixedHorizontally, isFixedVertically):
            return AnyView(self.fixedSize(horizontal: isFixedHorizontally, vertical: isFixedVertically))
        case .fixedSizeView:
            return AnyView(self.fixedSize())
        case let .multilineTextAlignment(alignment):
            return AnyView(self.multilineTextAlignment(alignment.render))
        case let .imageScale(scale):
            return AnyView(self.imageScale(scale.render))
        case let .minimumScaleFactor(factor):
            return AnyView(self.minimumScaleFactor(CGFloat(factor)))
        case let .animation(stateId,  isActiveKey, animation):
            //Need to figure out best use of this one 
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(self.animation(animation.render, value: isActive))
            } else {
                return AnyView(self)
            }
        case let .edgesIgnoringSafeArea(edges):
            return AnyView(self.edgesIgnoringSafeArea(edges.render))
        case let .disabled(stateId, isDisabledKey):
            if let isDisabled = findBooleanValue(stateId: stateId, id: isDisabledKey, state: state.value){
                return AnyView(self.disabled(isDisabled))
            } else {
                return AnyView(self)
            }
        case let .buttonStyle(style):
            return AnyView(self.buttonStyle(style.render).eraseToAnyView())
        case let .position(stateId, xKey, yKey, x, y):
            let xPosition = findDoubleValue(stateId: stateId, id: xKey, state: state.value)
            let yPosition = findDoubleValue(stateId: stateId, id: yKey, state: state.value)
            switch (xPosition, yPosition) {
            case (.some(let position), .none):
                return AnyView(self.position(x: position))
            case (.none, .some(let position)):
                return AnyView(self.position(y: position))
            case (.some(let positionX), .some(let positionY)):
                return AnyView(self.position(x: positionX, y: positionY))
            case (.none, .none):
                switch (x, y) {
                case (.some(let position), .none):
                    return AnyView(self.position(x: position))
                case (.none, .some(let position)):
                    return AnyView(self.position(y: position))
                case (.some(let positionX), .some(let positionY)):
                    return AnyView(self.position(x: positionX, y: positionY))
                case (.none, .none):
                    return AnyView(self)
                }
            }
        case let .shadow(stateId, colorKey, radiusKey, xKey, yKey, colorHex, radius, x, y):
            let stateRadius = findDoubleValue(stateId: stateId, id: radiusKey, state: state.value)
            let stateColor = findStringValue(stateId: stateId, id: colorKey, state: state.value)
            let stateXPosition = findDoubleValue(stateId: stateId, id: xKey, state: state.value)
            let stateYPosition = findDoubleValue(stateId: stateId, id: yKey, state: state.value)
            switch (stateRadius, stateColor, stateXPosition, stateYPosition) {
            case (.some(let radius), .none, .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    self.shadow(radius: CGFloat(radius),
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .none, .some(let yPosition)):
                return AnyView(
                    self.shadow(radius: CGFloat(radius),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .none, .none):
                return AnyView(
                    self.shadow(radius: CGFloat(radius))
                )
            case (.none, .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0,
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .some(let colorHex), .none, .some):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0)
                )
            case (.none, .some(let colorHex), .none, .none):
                return AnyView(self.shadow(color: Color(uiColor: UIColor.hex(colorHex)), radius: 0))
            case (.none, .none, .some(let xPosition), .none):
                return AnyView(
                    self.shadow(radius: 0,
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .none, .none):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius))
                )
            case (.some(let radius), .some(let colorHex), .some(let xPosition), .none):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .none, .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    self.shadow(radius: 0,
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .none, .none, .some(let yPosition)):
                return AnyView(
                    self.shadow(radius: 0,
                                y: CGFloat(yPosition))
                )
            case (.none, .some(let colorHex), .some(let xPosition), .none):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0,
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .none, .some(let yPosition)):
                return AnyView(
                    self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .some(let xPosition), .none):
                return AnyView(
                    self.shadow(radius: CGFloat(radius), x: CGFloat(xPosition))
                )
            case (.none, .none, .none, .none):
                switch (radius, colorHex, x, y) {
                case (.some(let radius), .none, .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        self.shadow(radius: CGFloat(radius),
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .none, .some(let yPosition)):
                    return AnyView(
                        self.shadow(radius: CGFloat(radius),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .none, .none):
                    return AnyView(
                        self.shadow(radius: CGFloat(radius))
                    )
                case (.none, .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0,
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .some(let colorHex), .none, .some):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0)
                    )
                case (.none, .some(let colorHex), .none, .none):
                    return AnyView(self.shadow(color: Color(uiColor: UIColor.hex(colorHex)), radius: 0))
                case (.none, .none, .some(let xPosition), .none):
                    return AnyView(
                        self.shadow(radius: 0,
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .none, .none):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius))
                    )
                case (.some(let radius), .some(let colorHex), .some(let xPosition), .none):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .none, .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        self.shadow(radius: 0,
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .none, .none, .some(let yPosition)):
                    return AnyView(
                        self.shadow(radius: 0,
                                    y: CGFloat(yPosition))
                    )
                case (.none, .some(let colorHex), .some(let xPosition), .none):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0,
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .none, .some(let yPosition)):
                    return AnyView(
                        self.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .some(let xPosition), .none):
                    return AnyView(
                        self.shadow(radius: CGFloat(radius), x: CGFloat(xPosition))
                    )
                case (.none, .none, .none, .none):
                    return AnyView(self)
                }
            }
        case let .pickerStyle(style):
            return AnyView(self.pickerStyle(style.render))
        case let .blur(stateId, radiusKey, isOpaqueKey, radius, isOpaque):
            let stateRadius = findDoubleValue(stateId: stateId, id: radiusKey, state: state.value)
            let stateIsOpaque = findBooleanValue(stateId: stateId, id: isOpaqueKey, state: state.value)
            switch (stateRadius, stateIsOpaque){
            case (.some(let radius), .some(let isOpaque)):
                return AnyView(self.blur(radius: CGFloat(radius), opaque: isOpaque))
            case (.some(let radius), .none):
                return AnyView(self.blur(radius: CGFloat(radius)))
            case (.none, .some(let isOpaque)):
                return AnyView(self.blur(radius: 0, opaque: isOpaque))
            case (.none, .none):
                switch (radius, isOpaque) {
                case (.some(let radius), .some(let isOpaque)):
                    return AnyView(self.blur(radius: CGFloat(radius), opaque: isOpaque))
                case (.some(let radius), .none):
                    return AnyView(self.blur(radius: CGFloat(radius)))
                case (.none, .some(let isOpaque)):
                    return AnyView(self.blur(radius: 0, opaque: isOpaque))
                case (.none, .none):
                    return AnyView(self)
                }
            }
        case let .brightness(stateId, amountKey, amount):
            if let amount = findDoubleValue(stateId: stateId, id: amountKey, state: state.value) {
                return AnyView(self.brightness(amount))
            } else if let amount = amount {
                return AnyView(self.brightness(amount))
            } else {
                return AnyView(self)
            }
        case let .textRenderingMode(mode):
            return AnyView(self.symbolRenderingMode(mode.render))
        case let .antiAliased(stateId, isAntiAliasedKey, isAntialiased):
            guard let view = self as? Image else { return AnyView(self) }
            if let isAntialiased = findBooleanValue(stateId: stateId, id: isAntiAliasedKey, state: state.value) {
                return AnyView(view.antialiased(isAntialiased))
            } else if let isAntialiased = isAntialiased {
                return AnyView(view.antialiased(isAntialiased))
            } else {
                return AnyView(self)
            }
        case let .resizable(capInsets, resizingMode):
            guard let view = self as? Image else { return AnyView(self) }
            switch (capInsets, resizingMode) {
            case (.some(let insets), .some(let mode)):
                return AnyView(view.resizable(capInsets: insets.render, resizingMode: mode.render))
            case (.some(let insets), .none):
                return AnyView(view.resizable(capInsets: insets.render))
            case (.none, .some(let mode)):
                return AnyView(view.resizable(resizingMode: mode.render))
            case (.none, .none):
                return AnyView(view.resizable())
            }
        case let .imageRenderingMode(mode):
            guard let view = self as? Image else { return AnyView(self)}
            return AnyView(view.renderingMode(mode.render))
        case .colorInvert:
            return AnyView(self.colorInvert())
        case let .colorMultiply(stateId, colorKey, colorHex):
            if let colorHex = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(self.colorMultiply(Color(uiColor: UIColor.hex(colorHex))))
            } else if !colorHex.isEmpty {
                return AnyView(self.colorMultiply(Color(uiColor: UIColor.hex(colorHex))))
            } else {
                return AnyView(self)
            }
        case let .datePickerStyle(style):
            return AnyView(self.datePickerStyle(style.render))
        }
    }
    
    
    func addModifiers(mods: [InjectedModifier], state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        print(state.value)
        return mods
            .reduce(AnyView(self), { accum, nextModifier -> AnyView in
                accum.addModifier(modifier: nextModifier, state: state, container: container).eraseToAnyView()
            })
    }
}
