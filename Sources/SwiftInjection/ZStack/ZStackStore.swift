//
//  ZStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//

import Foundation
import Combine
import SwiftUI

class ZStackStore: ObservableObject {
    @Published var state: InjectedState
    @Published var alignment: Alignment = .center
    private var cancellables = Set<AnyCancellable>()
    
    let stateSubject: StateSignal
    let viewStore: ZStackViewStore
    
    init(store: ZStackViewStore,
         stateSubject: StateSignal) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state  -> Alignment in
            let alignment = findStringValue(stateId: state.id, id: store.alignmentKey, state: state) ?? ""
            return ZStackAlignment(rawValue: alignment)?.render ?? .center
        }.compactMap { $0 }.assign(to: &$alignment)
        
    }
}
