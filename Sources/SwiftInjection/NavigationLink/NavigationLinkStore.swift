//
//  NavigationLinkStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import Combine

class NavigationLinkStore: ObservableObject {
    var viewStore: NavigationLinkViewStore
    var stateSignal: StateSignal
    init(viewStore: NavigationLinkViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
