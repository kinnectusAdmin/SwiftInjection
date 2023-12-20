//
//  ForEachStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/2/23.
//

import Foundation
import Combine


class ForEachStore: ObservableObject {
    @Published var forEachStates: [InjectedState] = []
    var forEachStateSubjects: [StateSignal] {
        forEachStates.map {
            StateSignal($0)
        }
    }
    @Published var viewStore: ForEachViewStore
    @Published var stateSignal: StateSignal
    @Published var state: InjectedState
    private var cancellables = Set<AnyCancellable>()

    init(viewStore: ForEachViewStore,
         stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal

        self.state = stateSignal.value

        stateSignal.eraseToAnyPublisher().map { state in
            let forEachKey = viewStore.forEachKey

            if let forEach = state.map(key: forEachKey)?.array as? [InjectedValue] {
                return forEach.map { InjectedState(id: $0.id, parameter1: $0) }
            } else {
                return []
            }
        }.assign(to: &$forEachStates)
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
    }

    public func stateForItem(_ forEachState: InjectedState) -> StateSignal {
        forEachStateSubjects.first(where: {$0.value.id == forEachState.id}) ?? StateSignal(InjectedState.init(id: ""))
    }   
}
