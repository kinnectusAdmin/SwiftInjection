//
//  ScrollStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation
import SwiftUI

final class ScrollStore: ObservableObject {
    let viewStore: ScrollViewStore
    let stateSignal: StateSignal
    
    init(viewStore: ScrollViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}

