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
    var stateSubject: StateSignal
    init(viewStore: NavigationLinkViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
