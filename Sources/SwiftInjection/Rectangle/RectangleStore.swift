//
//  RectangleStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

final class RectangleStore: ObservableObject {
    let viewStore: RectangleViewStore, stateSubject: StateSignal
    
    init(viewStore: RectangleViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
