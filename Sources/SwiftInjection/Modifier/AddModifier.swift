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
    
    func addModifier(injectedModifier: InjectedModifier, state: StateSignal, container: ViewStoresContainer) -> some View {
        modifier(InjectedModifierStore(modifier: injectedModifier, state: state, container: container))
    }
    
    
    func addModifiers(mods: [InjectedModifier], state: StateSignal, container: ViewStoresContainer) -> some View {
        return mods
            .reduce(AnyView(self), { accum, nextModifier -> AnyView in
                accum.addModifier(injectedModifier: nextModifier, state: state, container: container).eraseToAnyView()
            })
    }
}
