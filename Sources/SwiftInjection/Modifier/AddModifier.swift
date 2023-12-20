//
//  InjectedModifier_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
import SwiftUI

public extension View {
    
    func addModifier(injectedModifier: InjectedModifier, stateSignal: StateSignal, container: ViewStoresContainer) -> some View {
        modifier(ModifierStore(modifier: injectedModifier, state: stateSignal, container: container))
    }
    
    
    func addModifiers(mods: [InjectedModifier], stateSignal: StateSignal, container: ViewStoresContainer) -> some View {
        return mods
            .reduce(AnyView(self), { accum, nextModifier -> AnyView in
                accum.addModifier(injectedModifier: nextModifier, stateSignal: stateSignal, container: container).eraseToAnyView()
            })
    }
}
