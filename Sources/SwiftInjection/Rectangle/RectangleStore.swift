//
//  RectangleStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

final class RectangleStore: ObservableObject {
    let viewStore: RectangleViewStore, stateSignal: StateSignal
    
    init(viewStore: RectangleViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
