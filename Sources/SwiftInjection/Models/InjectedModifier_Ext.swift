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
        case let .systemFont(stateId, descriptionId, description):
            if let fontDescription = findStringValue(stateId: stateId, id: descriptionId, state: state.value), let injectedSystemFont = InjectedSystemFont(rawValue: fontDescription) {
                return AnyView(
                    self.font(injectedSystemFont.font)
                )
            } else if let injectedSystemFont = InjectedSystemFont(rawValue: description) {
                return AnyView(
                    self.font(injectedSystemFont.font)
                )
            } else {
                return AnyView(self)
            }
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
