//
//  ButtonStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine


class ButtonStore: ObservableObject {

    @Published var state: InjectedState
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: ButtonViewStore
    let stateSignal: StateSignal

    @InjectedFunctionBuilder var action: InjectedFunctionBuilder {
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation1 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation2 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation3 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation4 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation5 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation6 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation7 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation8 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation9 ?? .noOperation)
        InjectedFunctionBuilder(
            stateSignal: stateSignal,
            operation: viewStore.operation10 ?? .noOperation)
    }
    
    init(viewStore: ButtonViewStore,
         stateSignal: StateSignal
    ) {
        self.stateSignal = stateSignal
        self.viewStore = viewStore
        self.state = stateSignal.value
        
        stateSignal
            .eraseToAnyPublisher()
            .removeDuplicates()
            .map({
                $0
            })
            .assign(to: &$state)
        
    }
    
    public func didCommitAction() {
        if let state = action.stateSignal {
            stateSignal.send(state.value)
        }
    }
}


