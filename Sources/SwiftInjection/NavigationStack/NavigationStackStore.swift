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
    var stateSubject: StateSignal
    init(viewStore: NavigationStackViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
