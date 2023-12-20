//
//  ListStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI
import Combine

class ListStore: ObservableObject {
    @Published var listStates: [InjectedState] = []
    var itemStateSubjects: [StateSignal] {
        listStates.map {
            StateSignal($0)
        }
    }
    @Published var viewStore: ListViewStore
    @Published var stateSignal: StateSignal
    @Published var state: InjectedState
    private var cancellables = Set<AnyCancellable>()
    init(viewStore: ListViewStore,
         stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal

        self.state = stateSignal.value
        
        stateSignal.eraseToAnyPublisher().map { state in
            let listKey = viewStore.listKey
            
            if let list = state.map(key: listKey)?.array as? [InjectedValue] {
                return list.map { InjectedState(id: $0.id, parameter1: $0) }
            } else {
                return []
            }
        }.assign(to: &$listStates)
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
    }
    
    public func stateForItem(_ itemState: InjectedState) -> StateSignal {
        itemStateSubjects.first(where: {$0.value.id == itemState.id}) ?? StateSignal(InjectedState.init(id: ""))
    }
}
