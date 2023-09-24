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
            if let alignmentString = findStringValue(stateId: stateId, id: alignmentId, state: state.value), let alignment = ZStackAlignment(rawValue: alignmentString) {
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
            if let id = findStringValue(stateId: stateId, id: edgeSetId, state: state.value), let edgeSet = InjectedEdgeSet(rawValue: id) {
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
            return AnyView(self.strikethrough())
        case let .underline(stateId, isActiveKey, patternKey, pattern, colorKey, hexColor):
            return AnyView(self)
        case let .lineLimit(lowerRange, upperRange):
            return AnyView(self)
        case let .unredacted:
            return AnyView(self)
        case let .truncationMode(mode):
            return AnyView(self)
        case let .layoutPriority(priority):
            return AnyView(self)
        case let .tag(tag):
            return AnyView(self)
        case let .blendMode(injectedBlendMode):
            return AnyView(self)
        case let .fixedSize(horizontal, vertical):
            return AnyView(self)
        case let .multilineTextAlignment(alignment):
            return AnyView(self)
        case let .imageScale(scale):
            return AnyView(self)
        case let .minimumScaleFactor(factor):
            return AnyView(self)
        case let .animation(animation):
            return AnyView(self)
        case let .animationWithValue(animation, valueKey):
            return AnyView(self)
        case let .edgesIgnoringSafeArea(edges):
            return AnyView(self)
        case let .disabled(stateId, isDisabledKey: String):
            return AnyView(self)
        case let .buttonStyle(style):
            return AnyView(self)
        case let .position(x, y):
            return AnyView(self)
        case let .shadow(stateId, colorKey, radiusKey, xKey, yKey, colorHex, radius, x, y):
            return AnyView(self)
        case let .pickerStyle(style):
            return AnyView(self)
        case let .blur(stateId, radiusKey, isOpaqueKey, radius, isOpaque):
            return AnyView(self)
        case let .brightness(stateId, amountKey, amount):
            return AnyView(self)
        case let .textRenderingMode(injectedSymbolRenderingMode):
            return AnyView(self)
        case let .antiAliased(stateId, isAntiAliasedKey, isAntialised):
            return AnyView(self)
        case let .resizingable(capInsets, resizingMode):
            return AnyView(self)
        case let .imageRenderingMode(injectedImageRenderingMode):
            return AnyView(self)
        case .colorInvert:
            return AnyView(self)
        case let .colorMultiply(stateId, colorKey, colorHex):
            return AnyView(self)
        case let .datePickerStyle(injectdDatePickerStyle):
            return AnyView(self)
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
