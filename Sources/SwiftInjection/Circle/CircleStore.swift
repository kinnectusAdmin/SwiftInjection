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
    let stateSubject: StateSignal
    
    init(viewStore: CircleViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
