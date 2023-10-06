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
    let stateSubject: StateSignal
    
    init(viewStore: EllipseViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
