//
//  TextStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine

class TextStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    
    let viewStore: TextViewStore
    let stateSignal: StateSignal
    
    init(viewStore: TextViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
        
        $state
            .map { findStringValue(stateId: $0.id, id: viewStore.textKey, state: $0) ?? viewStore.text}
        .compactMap { $0 }
        .assign(to: &$text)
    }
}

