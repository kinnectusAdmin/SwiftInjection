//
//  StandardTableStore.swift
//
//
//  Created by Blake Osonduagwueki on 10/19/23.
//

import Foundation
import SwiftUI

final class StandardTableStore: ObservableObject {
    let viewStore: StandardTableViewStore
    let stateSignal: StateSignal
    @Published var state: InjectedState
    @Published var tableStateValues: [InjectedState] = []
    init(viewStore: StandardTableViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state -> [InjectedState] in
            findStateArrayValue(stateId: state.id, id: viewStore.tableStateKey, state: state) ?? []
        }.assign(to: &$tableStateValues)
    }
}
