//
//  ColorStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//
import SwiftUI
import Combine

class ColorStore: ObservableObject {
    
    @Published var color: Color = .white
    @Published var viewStore: ColorViewStore
    @Published var stateSubject: StateSignal
    @Published var state: InjectedState

    init(store: ColorViewStore, state: StateSignal) {
        self.viewStore = store
        self.stateSubject = state
        self.state = state.value
        if let colorValue = findStringValue(stateId: state.value.id, id: store.id, state: state.value) {
            self.color = Color(UIColor.hex(colorValue))
        } else {
            self.color = Color(UIColor.hex(viewStore.colorKey))
        }
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        $state
            .map { findStringValue(stateId: $0.id, id: store.colorKey, state: $0) }
        .compactMap {$0}
        .map { Color(UIColor.hex($0))}
        .assign(to: &$color)
    }
}
