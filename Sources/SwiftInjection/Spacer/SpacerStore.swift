//
//  SpacerStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine

class SpacerStore: ObservableObject {

    @Published var state: InjectedState
    
    let viewStore: SpacerViewStore
    let stateSignal: StateSignal
    
    init(viewStore: SpacerViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
    }
}
