//
//  File 12.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI
import Combine

class GridStore: ObservableObject {
    @Published var state: InjectedState
    private var cancellables = Set<AnyCancellable>()
    @Published var gridComposition: GridComposition = .standard
    let stateSubject: StateSignal
    let viewStore: GridViewStore
    
    init(viewStore: GridViewStore,
         stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state  -> GridComposition in
            switch (viewStore.alignment, viewStore.horizontalSpacing, viewStore.verticalSpacing) {
            case (.some(let alignment), .some(let horizontalSpacing), .some(let verticalSpacing)):
                return .alignment_horizontal_verticalSpacing(alignment, horizontalSpacing, verticalSpacing)
            case (.some(let alignment), .some(let horizontalSpacing), .none):
                return .alignment_horizontalSpacing(alignment, horizontalSpacing)
            case (.some(let alignment), .none, .some(let verticalSpacing)):
                return .alignment_verticalSpacing(alignment, verticalSpacing)
            case (.none, .some(let horizontalSpacing), .some(let verticalSpacing)):
                return .horizontal_verticalSpacing(horizontalSpacing, verticalSpacing)
            case (.none, .none, .some(let verticalSpacing)):
                return .verticalSpacing(verticalSpacing)
            case (.none, .some(let horizontalSpacing), .none):
                return .horizontalSpacing(horizontalSpacing)
            case (.some(let alignment), .none, .none):
                return .alignment(alignment)
            case (.none, .none, .none):
                return .standard
            }
        }.compactMap { $0 }.assign(to: &$gridComposition)
    }
}

extension GridStore {
    enum GridComposition {
        case alignment_horizontal_verticalSpacing(InjectedAlignment, Double, Double)
        case alignment_horizontalSpacing(InjectedAlignment, Double)
        case alignment_verticalSpacing(InjectedAlignment, Double)
        case horizontal_verticalSpacing(Double, Double)
        case verticalSpacing(Double)
        case horizontalSpacing(Double)
        case alignment(InjectedAlignment)
        case standard
    }
}
