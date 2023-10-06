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
    let stateSubject: StateSignal
    
    init(viewStore: CapsuleViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
