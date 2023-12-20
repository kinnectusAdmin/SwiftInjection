//
//  IfStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
import Combine

class IfStore: ObservableObject {
    var viewStore: IfViewStore
    var stateSignal: StateSignal
    @Published var state: InjectedState
    @Published var condition: Bool = false
    
    init(viewStore: IfViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        self.condition = findBooleanValue(stateId: stateSignal.value.id, id: viewStore.conditionKey, state: state) ?? false

        self.stateSignal.eraseToAnyPublisher().assign(to: &$state)

        stateSignal.map { state in 
            findBooleanValue(stateId: state.id, id: viewStore.conditionKey, state: state)
        }
        .compactMap { $0 }
        .assign(to: &$condition)
    }
}
