//
//  SecureFieldStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/29/23.
//

import Foundation
import Combine
import SwiftUI

class SecureFieldStore: ObservableObject {
    @Published var state: InjectedState
    @Published var text: String = ""
    @Published var title: String = ""
    @Published var prompt: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: SecureFieldViewStore
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
    
    init(viewStore: SecureFieldViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.state = stateSignal.value
        self.stateSignal = stateSignal
        
        stateSignal
        .eraseToAnyPublisher()
        .map({ $0 })
        .assign(to: &$state)
        
        $state
        .map { findStringValue(stateId: $0.id, id: viewStore.textKey, state: $0) }
        .compactMap { $0 }
        .assign(to: &$text)
        
        $state
        .map { findStringValue(stateId: $0.id, id: viewStore.titleKey ?? viewStore.title, state: $0) }
        .map { $0 ?? viewStore.title }
        .compactMap { $0 }
        .assign(to: &$title)
        
        $state
            .map { findStringValue(stateId: $0.id, id: viewStore.promptKey ?? viewStore.prompt, state: $0) }
        .compactMap { $0 }
        .assign(to: &$prompt)
    }
}
