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
    @Published var stateSignal: StateSignal
    @Published var state: InjectedState

    init(viewStore: ColorViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        if let colorValue = findStringValue(stateId: stateSignal.value.id, id: viewStore.id, state: stateSignal.value) {
            self.color = Color(UIColor.hex(colorValue))
        } else {
            self.color = Color(UIColor.hex(viewStore.colorKey))
        }
        stateSignal
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        $state
            .map { findStringValue(stateId: $0.id, id: viewStore.colorKey, state: $0) }
        .compactMap {$0}
        .map { Color(UIColor.hex($0))}
        .assign(to: &$color)
    }
}
