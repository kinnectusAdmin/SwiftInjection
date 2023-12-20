//
//  LazyHStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine
import SwiftUI

class LazyHStackStore: ObservableObject {
    @Published var state: InjectedState
    @Published var spacing: CGFloat? = nil
    @Published var alignment: VerticalAlignment = .center
    
    private var cancellables = Set<AnyCancellable>()
    let stateSignal: StateSignal
    let viewStore: HStackViewStore
  
    init(viewStore: HStackViewStore,
         stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state in
            let alignment = findStringValue(stateId: state.id, id: viewStore.alignmentKey, state: state) ?? ""
            return InjectedVerticalAlignment(rawValue: alignment)?.render ?? .center
        }.compactMap { $0 }.assign(to: &$alignment)

        $state.map { state in
            if let spacing = findDoubleValue(stateId: state.id, id: viewStore.spacingKey, state: state) {
                return CGFloat(spacing)
            } else {
                return nil
            }
        }.assign(to: &$spacing)
    }
}

