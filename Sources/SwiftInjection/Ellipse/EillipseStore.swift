//
//  EllipseStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation
import SwiftUI

final class EllipseStore: ObservableObject {
    let viewStore: EllipseViewStore
    let stateSignal: StateSignal
    
    init(viewStore: EllipseViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
