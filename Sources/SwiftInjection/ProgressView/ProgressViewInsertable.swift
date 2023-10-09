//
//  File.swift
//  
//
//  Created by Blake Osonduagwueki on 10/8/23.
//

import Foundation
import SwiftUI

struct ProgressViewInsertable: View {
    @ObservedObject var store: ProgressStore
    var container: ViewStoresContainer
    
    var body: some View {
        switch store.composition {
        case .standard:
            ProgressView().addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case .title(let title):
            
            ProgressView(title).addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case .title_value(let title, let value, let total):
            
            ProgressView(title, value: Float(value), total: Float(total)).addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case .label(let label):
            
            ProgressView {
                Insertable(state: store.stateSubject, container: container, viewStore: label)
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case .timerInterval(let lowerDate, let upperDate):
            
            ProgressView(timerInterval: ClosedRange(uncheckedBounds: (lowerDate,upperDate))).addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case .timerInterval_label(let lowerDate, let upperDate, let label):
            
            ProgressView(timerInterval: ClosedRange(uncheckedBounds: (lowerDate, upperDate))) {
                Insertable(state: store.stateSubject, container: container, viewStore: label)
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .timerInterval_countsdown_label_currentValueLabel(lowerDate,
                                                              upperDate,
                                                              countsdown,
                                                              label,
                                                                   currentValueLabel):
            
            ProgressView(timerInterval: ClosedRange(uncheckedBounds: (lowerDate,upperDate)), countsDown: countsdown) {
                Insertable(state: store.stateSubject, container: container, viewStore: label)
            } currentValueLabel: {
                Insertable(state: store.stateSubject, container: container, viewStore: currentValueLabel)
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .value_total(value, total):
            
            ProgressView.init(value: Float(value), total: Float(total)).addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .value_total_label(value, total, label):
            
            ProgressView.init(value: Float(value), total: Float(total)) {
                Insertable(state: store.stateSubject, container: container, viewStore: label)
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .value_total_label_currentValueLabel(value, total, label, currentValueLabel):
            
            ProgressView.init(value: Float(value), total: Float(total)) {
                Insertable(state: store.stateSubject, container: container, viewStore: label)
            } currentValueLabel: {
                Insertable(state: store.stateSubject, container: container, viewStore: currentValueLabel)
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)

            
        }
    }
}
