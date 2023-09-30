//
//  ModifierStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/30/23.
//

import Foundation
import SwiftUI

struct ModifierStore: ViewModifier {
    var modifier: InjectedModifier
    var state: StateSignal
    var container: ViewStoresContainer
    
    func body(content: Content) -> some View {
        switch modifier {
        case .systemFont(let injectedSystemFont):
            return AnyView(
                content.font(injectedSystemFont.font)
            )
        case let .font(stateId, nameId, sizeId, fontName, fontSize):
            //Route state value using statedi and id
            if let fontName = findStringValue(stateId: stateId, id: nameId, state: state.value), let fontSize = findDoubleValue(stateId: stateId, id: sizeId, state: state.value) {
                return AnyView(
                    content.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else if let fontName = fontName, let fontSize = fontSize {
                return AnyView(
                    content.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else {
                return AnyView(content)
            }
        case .fontWeight(let weight):
            return AnyView(
                content.fontWeight(weight.render)
            )
        case let .width(stateId, widthId, width):
            //Route state value using statedi and id
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    content.frame(width: width)
                )
            } else if let width = width {
                return AnyView(
                    content.frame(width: width)
                )
            } else {
                return AnyView(content)
            }
        case let .height(stateId, heightId, height):
            //Route state value using statedi and id
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    content.frame( height: height)
                )
            } else if let height = height {
                return AnyView(
                    content.frame(height: height)
                )
            } else {
                return AnyView(content)
            }
        
        case let .foregroundColor(stateId, id, hex):
            if let hexValue = findStringValue(stateId: stateId, id: id, state: state.value) {
                return AnyView(
                    content.foregroundColor(Color(UIColor.hex(hexValue)))
                )
            } else if let hex = hex {
                return AnyView(
                    content.foregroundColor(Color(UIColor.hex(hex)))
                )
            } else {
                return AnyView(content)
            }
        case let .background(viewStore, alignment):
                return AnyView(
                    content.background(Insertable(state: state, container: container, viewStore: viewStore), alignment: (alignment ?? .center).render)
                )
        case let .fullScreenCover(stateId, viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                return AnyView(
                    content.fullScreenCover(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(content)
            }
        case let .sheet(stateId, viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                return AnyView(
                    content.sheet(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(content)
            }
        case let .alert(stateId, isPresentedKey, alertView):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                switch alertView {
                case let .dismissAlert(store):
                    return AnyView(content.alert(isPresented: .constant(isPresented), content: {
                        DismissAlertView(viewStore: store, state: state, container: container).render
                    }))
                case let .primarySecondaryAlert(store):
                    return AnyView(content.alert(isPresented: .constant(isPresented), content: {
                        PrimarySecondaryAlertView(viewStore: store, state: state, container: container).render
                    }))
                }
            } else {
                return AnyView(content)
            }
        case let .confirmationDialog(stateId, titleKey, isPresentedKey, titleVisibility, title, actions):
            let title = findStringValue(stateId: stateId, id: titleKey, state: state.value) ?? title ?? ""
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value), let visibility = titleVisibility {
                return AnyView(
                    content.confirmationDialog(title, isPresented: .constant(isPresented), titleVisibility: visibility.render, actions: {
                        Insertable(state: state, container: container, viewStore: actions)
                    })
                )
            } else if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                return AnyView(
                    content.confirmationDialog(title, isPresented: .constant(isPresented), actions: {
                        Insertable(state: state, container: container, viewStore: actions)
                    })
                )
            } else {
                return AnyView(content)
            }
        case let .popover(stateId, isPresentedKey, popoverAttachmentAnchor, edge, injectedContent):
            if let isPresented = findBooleanValue(stateId: stateId, id: isPresentedKey, state: state.value) {
                switch (popoverAttachmentAnchor, edge) {
                case (.some(let anchor), .some(let edge)):
                    return AnyView(
                        content.popover(isPresented: .constant(isPresented),
                                        attachmentAnchor: anchor.render,
                                        arrowEdge: edge.render,
                                        content: {
                                            Insertable(state: state, container: container, viewStore: injectedContent)
                                        }
                                       )
                    )
                case (.none, .some(let edge)):
                    return AnyView(content.popover(isPresented: .constant(isPresented), arrowEdge: edge.render, content: {
                        Insertable(state: state, container: container, viewStore: injectedContent)
                    }))
                case (.some(let anchor), .none):
                    return AnyView(content.popover(isPresented: .constant(isPresented), attachmentAnchor: anchor.render, content: {
                        Insertable(state: state, container: container, viewStore: injectedContent)
                    }))
                case (.none, .none):
                    return AnyView(content.popover(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: injectedContent)
                    }))
                }
            } else {
                return AnyView(content)
            }
        case let .cornerRadius(stateId, valueId, radius):
            //Route state value using statedi and id
            if let radiusValue = findDoubleValue(stateId: stateId, id: valueId, state: state.value) {
                return AnyView(
                    content.cornerRadius(CGFloat(radiusValue))
                )
            } else if let radius = radius {
                return AnyView(
                    content.cornerRadius(CGFloat(radius))
                )
            } else {
                return AnyView(content)
            }
        case let .borderline(stateId, widthId, colorId, width, color):
            if let widthValue = findDoubleValue(stateId: stateId, id: widthId, state: state.value), let colorValue = findStringValue(stateId: stateId, id: colorId, state: state.value) {
                return AnyView(
                    content.border(Color(UIColor.hex(colorValue)), width: CGFloat(widthValue))
                )
            } else if let width = width, let color = color {
                return AnyView(
                    content.border(Color(UIColor.hex(color)), width: CGFloat(width))
                )
            } else {
                return AnyView(content)
            }
        case let .minWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    content.frame(minWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    content.frame(minWidth: CGFloat(width))
                )
            } else {
                return AnyView(content)
            }
        case let .maxWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    content.frame(maxWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    content.frame(maxWidth: CGFloat(width))
                )
            } else {
                return AnyView(content)
            }
            
        case let .minHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    content.frame(minHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    content.frame(minHeight: CGFloat(height))
                )
            } else {
                return AnyView(content)
            }
        case let .maxHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    content.frame(maxHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    content.frame(maxHeight: CGFloat(height))
                )
            } else {
                return AnyView(content)
            }
            
        case let .idealWidth(stateId, widthId, width):
            if let width = findDoubleValue(stateId: stateId, id: widthId, state: state.value) {
                return AnyView(
                    content.frame(idealWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    content.frame(idealWidth: CGFloat(width))
                )
            } else {
                return AnyView(content)
            }
        case let .idealHeight(stateId, heightId, height):
            if let height = findDoubleValue(stateId: stateId, id: heightId, state: state.value) {
                return AnyView(
                    content.frame(idealHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    content.frame(idealHeight: CGFloat(height))
                )
            } else {
                return AnyView(content)
            }
        case let .alignment(stateId, alignmentId, alignment):
            if let alignment = findValue(type: ZStackAlignment.self, stateId: stateId, id: alignmentId, state: state.value) {
                return AnyView(
                    content.frame(alignment: alignment.render)
                )
            } else if let alignment = alignment {
                return AnyView(
                    content.frame(alignment: alignment.render)
                )
            } else {
                return AnyView(content)
            }
        case let .padding(stateId, edgeSetId, lengthId, edgeSet, length):
            if let edgeSet = findValue(type: InjectedEdgeSet.self, stateId: stateId, id: edgeSetId, state: state.value){
                return AnyView(
                    content.padding(edgeSet.render, CGFloat(findDoubleValue(stateId: stateId, id: lengthId, state: state.value) ?? 10))
                )
            } else if let edgeSet = edgeSet {
                return AnyView(
                    content.padding(edgeSet.render, CGFloat(length ?? 10))
                )
            } else {
                return AnyView(content)
            }
        case let .bold(stateId, isActiveKey):
            if let isBold = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(content.bold(isBold))
            } else {
                return AnyView(content.bold())
            }
        case let .italic(stateId, isActiveKey):
            if let isItalicized = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(content.italic(isItalicized))
            } else {
                return AnyView(content.italic())
            }
        case .monoSpacedDigit:
            return AnyView(content.monospacedDigit())
        case let .monospaced(stateId, isActiveKey):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(content.monospaced(isActive))
            } else {
                return AnyView(content.monospaced())
            }
        case let .fontDesign(design):
            if #available(iOS 16.1, *) {
                return AnyView(content.fontDesign(design.render))
            } else {
                // Fallback on earlier versions
                return AnyView(content)
            }
        case let .fontWidth(width):
            return AnyView(content.fontWidth(width.render))
        case let .spacingBetweenText(spacing):
            return AnyView(content.kerning(CGFloat(spacing)))
        case let .tracking(tracking):
            return AnyView(content.tracking(CGFloat(tracking)))
        case let .opacity(opacity):
            return AnyView(content.opacity(CGFloat(opacity)))
        case let .strikeThrough(stateId, isActiveKey, patternKey, pattern, colorKey, hexColor):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value), let pattern = findValue(type: InjectedTextLineStylePattern.self, stateId: stateId, id: patternKey, state: state.value), let hexColor = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(
                    content.strikethrough(isActive, pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else if let pattern = pattern, !hexColor.isEmpty{
                return AnyView(
                    content.strikethrough(pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else {
                return AnyView(content.strikethrough())
            }
        case let .underline(stateId, isActiveKey, patternKey, pattern, colorKey, hexColor):
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value), let pattern = findValue(type: InjectedTextLineStylePattern.self, stateId: stateId, id: patternKey, state: state.value), let hexColor = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(
                    content.underline(isActive, pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else if let pattern = pattern, !hexColor.isEmpty{
                return AnyView(
                    content.underline(pattern: pattern.render, color: Color(UIColor.hex(hexColor)))
                )
            } else {
                return AnyView(content.underline())
            }
        case let .lineLimit(stateId, limitKey, limit):
            if let limit = findIntegerValue(stateId: stateId, id: limitKey, state: state.value) {
                return AnyView(content.lineLimit(limit))
            } else if let limit = limit {
                return AnyView(content.lineLimit(limit))
            } else {
                return AnyView(content)
            }
        case .unredacted:
            return AnyView(content.unredacted())
        case let .truncationMode(mode):
            return AnyView(content.truncationMode(mode.render))
        case let .layoutPriority(priority):
            return AnyView(content.layoutPriority(priority))
        case let .tag(tag):
            return AnyView(content.tag(tag))
        case let .blendMode(injectedBlendMode):
            return AnyView(content.blendMode(injectedBlendMode.render))
        case let .fixedSize(isFixedHorizontally, isFixedVertically):
            return AnyView(content.fixedSize(horizontal: isFixedHorizontally, vertical: isFixedVertically))
        case .fixedSizeView:
            return AnyView(content.fixedSize())
        case let .multilineTextAlignment(alignment):
            return AnyView(content.multilineTextAlignment(alignment.render))
        case let .imageScale(scale):
            return AnyView(content.imageScale(scale.render))
        case let .minimumScaleFactor(factor):
            return AnyView(content.minimumScaleFactor(CGFloat(factor)))
        case let .animation(stateId,  isActiveKey, animation):
            //Need to figure out best use of this one
            if let isActive = findBooleanValue(stateId: stateId, id: isActiveKey, state: state.value) {
                return AnyView(content.animation(animation.render, value: isActive))
            } else {
                return AnyView(content)
            }
        case let .edgesIgnoringSafeArea(edges):
            return AnyView(content.edgesIgnoringSafeArea(edges.render))
        case let .disabled(stateId, isDisabledKey):
            if let isDisabled = findBooleanValue(stateId: stateId, id: isDisabledKey, state: state.value){
                return AnyView(content.disabled(isDisabled))
            } else {
                return AnyView(content)
            }
        case let .buttonStyle(style):
            return AnyView(content.buttonStyle(style.render).eraseToAnyView())
        case let .position(stateId, xKey, yKey, x, y):
            let xPosition = findDoubleValue(stateId: stateId, id: xKey, state: state.value)
            let yPosition = findDoubleValue(stateId: stateId, id: yKey, state: state.value)
            switch (xPosition, yPosition) {
            case (.some(let position), .none):
                return AnyView(content.position(x: position))
            case (.none, .some(let position)):
                return AnyView(content.position(y: position))
            case (.some(let positionX), .some(let positionY)):
                return AnyView(content.position(x: positionX, y: positionY))
            case (.none, .none):
                switch (x, y) {
                case (.some(let position), .none):
                    return AnyView(content.position(x: position))
                case (.none, .some(let position)):
                    return AnyView(content.position(y: position))
                case (.some(let positionX), .some(let positionY)):
                    return AnyView(content.position(x: positionX, y: positionY))
                case (.none, .none):
                    return AnyView(content)
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
                    content.shadow(radius: CGFloat(radius),
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .none, .some(let yPosition)):
                return AnyView(
                    content.shadow(radius: CGFloat(radius),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .none, .none):
                return AnyView(
                    content.shadow(radius: CGFloat(radius))
                )
            case (.none, .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0,
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .some(let colorHex), .none, .some):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0)
                )
            case (.none, .some(let colorHex), .none, .none):
                return AnyView(content.shadow(color: Color(uiColor: UIColor.hex(colorHex)), radius: 0))
            case (.none, .none, .some(let xPosition), .none):
                return AnyView(
                    content.shadow(radius: 0,
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .none, .none):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius))
                )
            case (.some(let radius), .some(let colorHex), .some(let xPosition), .none):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .none, .some(let xPosition), .some(let yPosition)):
                return AnyView(
                    content.shadow(radius: 0,
                                x: CGFloat(xPosition),
                                y: CGFloat(yPosition))
                )
            case (.none, .none, .none, .some(let yPosition)):
                return AnyView(
                    content.shadow(radius: 0,
                                y: CGFloat(yPosition))
                )
            case (.none, .some(let colorHex), .some(let xPosition), .none):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: 0,
                                x: CGFloat(xPosition))
                )
            case (.some(let radius), .some(let colorHex), .none, .some(let yPosition)):
                return AnyView(
                    content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                radius: CGFloat(radius),
                                y: CGFloat(yPosition))
                )
            case (.some(let radius), .none, .some(let xPosition), .none):
                return AnyView(
                    content.shadow(radius: CGFloat(radius), x: CGFloat(xPosition))
                )
            case (.none, .none, .none, .none):
                switch (radius, colorHex, x, y) {
                case (.some(let radius), .none, .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        content.shadow(radius: CGFloat(radius),
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .none, .some(let yPosition)):
                    return AnyView(
                        content.shadow(radius: CGFloat(radius),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .none, .none):
                    return AnyView(
                        content.shadow(radius: CGFloat(radius))
                    )
                case (.none, .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0,
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .some(let colorHex), .none, .some):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0)
                    )
                case (.none, .some(let colorHex), .none, .none):
                    return AnyView(content.shadow(color: Color(uiColor: UIColor.hex(colorHex)), radius: 0))
                case (.none, .none, .some(let xPosition), .none):
                    return AnyView(
                        content.shadow(radius: 0,
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .none, .none):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius))
                    )
                case (.some(let radius), .some(let colorHex), .some(let xPosition), .none):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .none, .some(let xPosition), .some(let yPosition)):
                    return AnyView(
                        content.shadow(radius: 0,
                                    x: CGFloat(xPosition),
                                    y: CGFloat(yPosition))
                    )
                case (.none, .none, .none, .some(let yPosition)):
                    return AnyView(
                        content.shadow(radius: 0,
                                    y: CGFloat(yPosition))
                    )
                case (.none, .some(let colorHex), .some(let xPosition), .none):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: 0,
                                    x: CGFloat(xPosition))
                    )
                case (.some(let radius), .some(let colorHex), .none, .some(let yPosition)):
                    return AnyView(
                        content.shadow(color: Color(uiColor: UIColor.hex(colorHex)),
                                    radius: CGFloat(radius),
                                    y: CGFloat(yPosition))
                    )
                case (.some(let radius), .none, .some(let xPosition), .none):
                    return AnyView(
                        content.shadow(radius: CGFloat(radius), x: CGFloat(xPosition))
                    )
                case (.none, .none, .none, .none):
                    return AnyView(content)
                }
            }
        case let .pickerStyle(style):
            return AnyView(content.pickerStyle(style.render))
        case let .blur(stateId, radiusKey, isOpaqueKey, radius, isOpaque):
            let stateRadius = findDoubleValue(stateId: stateId, id: radiusKey, state: state.value)
            let stateIsOpaque = findBooleanValue(stateId: stateId, id: isOpaqueKey, state: state.value)
            switch (stateRadius, stateIsOpaque){
            case (.some(let radius), .some(let isOpaque)):
                return AnyView(content.blur(radius: CGFloat(radius), opaque: isOpaque))
            case (.some(let radius), .none):
                return AnyView(content.blur(radius: CGFloat(radius)))
            case (.none, .some(let isOpaque)):
                return AnyView(content.blur(radius: 0, opaque: isOpaque))
            case (.none, .none):
                switch (radius, isOpaque) {
                case (.some(let radius), .some(let isOpaque)):
                    return AnyView(content.blur(radius: CGFloat(radius), opaque: isOpaque))
                case (.some(let radius), .none):
                    return AnyView(content.blur(radius: CGFloat(radius)))
                case (.none, .some(let isOpaque)):
                    return AnyView(content.blur(radius: 0, opaque: isOpaque))
                case (.none, .none):
                    return AnyView(content)
                }
            }
        case let .brightness(stateId, amountKey, amount):
            if let amount = findDoubleValue(stateId: stateId, id: amountKey, state: state.value) {
                return AnyView(content.brightness(amount))
            } else if let amount = amount {
                return AnyView(content.brightness(amount))
            } else {
                return AnyView(content)
            }
        case let .textRenderingMode(mode):
            return AnyView(content.symbolRenderingMode(mode.render))
        case .antiAliased, .imageRenderingMode, .resizable:
            return AnyView(content)
        case .colorInvert:
            return AnyView(content.colorInvert())
        case let .colorMultiply(stateId, colorKey, colorHex):
            if let colorHex = findStringValue(stateId: stateId, id: colorKey, state: state.value) {
                return AnyView(content.colorMultiply(Color(uiColor: UIColor.hex(colorHex))))
            } else if !colorHex.isEmpty {
                return AnyView(content.colorMultiply(Color(uiColor: UIColor.hex(colorHex))))
            } else {
                return AnyView(content)
            }
        case let .datePickerStyle(style):
            return AnyView(content.datePickerStyle(style.render))
        case let .badge(stateId, badgeKey):
            if let badgeValue = findIntegerValue(stateId: stateId, id: badgeKey, state: state.value) {
                return AnyView(content.badge(badgeValue))
            } else {
                return AnyView(content)
            }
        case let .tabItem(item):
            return AnyView(content.tabItem({
                Insertable(state: state, container: container, viewStore: item)
            }))
        case let .keyboardType(keyboard):
            return AnyView(content.keyboardType(keyboard.render))
        case let .autoCorrectionDisabled(stateId, isDisabledKey, isDisabled):
            if let isDisabled = findBooleanValue(stateId: stateId, id: isDisabledKey, state: state.value) {
                return AnyView(content.autocorrectionDisabled(isDisabled))
            } else {
                return AnyView(content.autocorrectionDisabled(isDisabled))
            }
        case let .textInputAutoCapitalization(capitalization):
            return AnyView(content.textInputAutocapitalization(capitalization.render))
        case let .textContentType(contentType):
            return AnyView(content.textContentType(contentType.render))
        }
    }
}
