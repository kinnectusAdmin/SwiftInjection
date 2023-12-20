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
    
    let stateSignal: StateSignal
    let viewStore: ZStackViewStore
    
    init(viewStore: ZStackViewStore,
         stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        
        
        stateSignal
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state  -> Alignment in
            let alignment = findStringValue(stateId: state.id, id: viewStore.alignmentKey, state: state) ?? ""
            return InjectedAlignment(rawValue: alignment)?.render ?? .center
        }.compactMap { $0 }.assign(to: &$alignment)
        
    }
}
