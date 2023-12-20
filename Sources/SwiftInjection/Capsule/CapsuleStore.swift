//
//  CapsuleStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation
import SwiftUI

final class CapsuleStore: ObservableObject {
    let viewStore: CapsuleViewStore
    let stateSignal: StateSignal
    
    init(viewStore: CapsuleViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
