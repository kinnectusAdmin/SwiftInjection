//
// CircleStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation
import SwiftUI

final class CircleStore: ObservableObject {
    let viewStore: CircleViewStore
    let stateSignal: StateSignal
    
    init(viewStore: CircleViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
