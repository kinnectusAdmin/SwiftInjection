//
//  VStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine
import SwiftUI

class VStackStore: ObservableObject {
    @Published var state: InjectedState
    @Published var spacing: CGFloat? = nil
    @Published var alignment: HorizontalAlignment = .center
    private var cancellables = Set<AnyCancellable>()
    
    let stateSignal: StateSignal
    let viewStore: VStackViewStore
    
    init(viewStore: VStackViewStore,
         stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        
        
        stateSignal
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state in
            let alignment = findStringValue(stateId: state.id, id: viewStore.alignmentKey, state: state) ?? ""
            return InjectedHorizontalAlignment(rawValue: alignment)?.render ?? .center
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
