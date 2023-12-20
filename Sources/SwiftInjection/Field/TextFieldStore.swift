//
//  TextFieldStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine
import SwiftUI

class TextFieldStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: FieldViewStore
    let stateSignal: StateSignal
    
    var textBinding: Binding<String> {
        .init(
            get: {
                self.text
            },
            set: {[weak self] text in
                guard let self = self else { return }
                let state = updateState(state: self.state, newValue: .string(stateId: self.state.id, id: self.viewStore.textKey, value: text))
                self.stateSignal.send(state)
            }
        )
    }
    
    init(viewStore: FieldViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.state = stateSignal.value
        self.stateSignal = stateSignal
        
        stateSignal
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state
        .map { findStringValue(stateId: $0.id, id: viewStore.textKey, state: $0)}
        .compactMap { $0 }
        .assign(to: &$text)

    }
}
