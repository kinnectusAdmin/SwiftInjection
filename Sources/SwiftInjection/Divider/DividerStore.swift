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
    let stateSubject: StateSignal
    
    init(viewStore: DividerViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
