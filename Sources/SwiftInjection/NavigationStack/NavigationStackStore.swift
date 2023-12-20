//
//  NavigationStackStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import Combine

class NavigationStackStore: ObservableObject {
    var viewStore: NavigationStackViewStore
    var stateSignal: StateSignal
    init(viewStore: NavigationStackViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
