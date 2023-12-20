//
//  GridRowStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

final class GridRowStore: ObservableObject {
    let viewStore: GridRowViewStore
    let stateSignal: StateSignal
    @Published var state: InjectedState
    @Published var gridRowComposition: GridRowComposition = .standard
    init(viewStore: GridRowViewStore, stateSignal: StateSignal) {
        
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        if let alignment = viewStore.verticalAlignment {
            gridRowComposition = .alignment(alignment)
        } else {
            gridRowComposition = .standard
        }
    }
}

extension GridRowStore {
    enum GridRowComposition {
        case standard
        case alignment(InjectedVerticalAlignment)
    }
}
