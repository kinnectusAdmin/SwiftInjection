//
//  DividerStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/8/23.
//

import Foundation
import SwiftUI

final class DividerStore: ObservableObject {
    let viewStore: DividerViewStore
    let stateSignal: StateSignal
    
    init(viewStore: DividerViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
