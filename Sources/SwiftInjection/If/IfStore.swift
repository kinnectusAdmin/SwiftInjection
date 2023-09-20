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
    var stateSubject: CurrentValueSubject<InjectedState,Never>
    @Published var state: InjectedState
    @Published var condition: Bool = false
    
    init(store: IfViewStore, stateSubject: CurrentValueSubject<InjectedState,Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        self.condition = findBooleanValue(stateId: stateSubject.value.id, id: store.conditionKey, state: state) ?? false

        self.stateSubject.eraseToAnyPublisher().assign(to: &$state)

        stateSubject.map { state in 
            findBooleanValue(stateId: state.id, id: store.conditionKey, state: state)
        }
        .compactMap { $0 }
        .assign(to: &$condition)
    }
}
