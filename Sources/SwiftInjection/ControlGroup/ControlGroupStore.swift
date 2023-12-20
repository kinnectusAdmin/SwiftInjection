//
//  ControlGroupStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/22/23.
//

import Foundation
import SwiftUI

final class ControlGroupStore: ObservableObject {
    let viewStore: ControlGroupViewStore
    let stateSignal: StateSignal
    
    init(viewStore: ControlGroupViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
