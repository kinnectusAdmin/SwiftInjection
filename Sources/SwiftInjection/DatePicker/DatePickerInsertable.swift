//
//  DatePickerInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/24/23.
//

import Foundation
import SwiftUI

struct DatePickerInsertable: View {
    @ObservedObject var store: DatePickerStore
    var container: ViewStoresContainer
    var body: some View {
        switch store.composition {
        case let .title_selection_components(title, selection, components):
            
            DatePicker(title, selection: selection, displayedComponents: components.render).addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .selection_components_label(selection, components, label):
            
            DatePicker(selection: selection, displayedComponents: components.render) {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label)
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .selection_lowerRange_upperRange_components_label(selection, range, components, label):
            
            DatePicker(selection: selection, in: range, displayedComponents: components.render) {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label)
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
        }
    }
}

