//
//  Rectangle_Ext.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation
import SwiftUI

extension Rectangle {
    
    func addRectangleModifiers(modifiers: [InjectedModifier], state: StateSignal, container: ViewStoresContainer) -> any View {
        let pathModifiers: [InjectedModifier] = modifiers.filter { modifier in
            switch modifier {
            case .path:
                return true
            default:
                return false
            }
        }.compactMap {$0 }
        
        return pathModifiers.reduce(self as any Shape) { partialResult, modifier -> any Shape in
            switch modifier {
            case .path:
                return partialResult.path(in: .zero)
            default:
                return partialResult
            }
        }.addModifiers(mods: modifiers, state: state, container: container)
    }
}

extension RoundedRectangle {
    
    func addRectangleModifiers(modifiers: [InjectedModifier], state: StateSignal, container: ViewStoresContainer) -> any View {
        let pathModifiers: [InjectedModifier] = modifiers.filter { modifier in
            switch modifier {
            case .path:
                return true
            default:
                return false
            }
        }.compactMap {$0 }
        
        return pathModifiers.reduce(self as any Shape) { partialResult, modifier -> any Shape in
            switch modifier {
            case .path:
                return partialResult.path(in: .zero)
            default:
                return partialResult
            }
        }.addModifiers(mods: modifiers, state: state, container: container)
    }
}
