//
//  Image_Ext.swift
//  
//
//  Created by Blake Osonduagwueki on 9/30/23.
//

import Foundation
import SwiftUI

extension Image {
    func addModifiers(modifiers: [InjectedModifier], state: StateSignal, container: ViewStoresContainer) -> Image {
        modifiers.reduce(self) { partialResult, modifier in
            addModifier(modifier: modifier, state: state, container: container)
        }
    }
    
    func addModifier(modifier: InjectedModifier, state: StateSignal, container: ViewStoresContainer) -> Image {
        switch modifier {
        case let .antiAliased(stateId, isAntiAliasedKey, isAntialiased):
            if let isAntialiased = findBooleanValue(stateId: stateId, id: isAntiAliasedKey, state: state.value) {
                return self.antialiased(isAntialiased)
            } else if let isAntialiased = isAntialiased {
                return self.antialiased(isAntialiased)
            } else {
                return self
            }
        case let .resizable(capInsets, resizingMode):
            switch (capInsets, resizingMode) {
            case (.some(let insets), .some(let mode)):
                return self.resizable(capInsets: insets.render, resizingMode: mode.render)
            case (.some(let insets), .none):
                return self.resizable(capInsets: insets.render)
            case (.none, .some(let mode)):
                return self.resizable(resizingMode: mode.render)
            case (.none, .none):
                return self.resizable()
            }
        case let .imageRenderingMode(mode):
            return self.renderingMode(mode.render)
        default:
            return self
        }
    }
}
