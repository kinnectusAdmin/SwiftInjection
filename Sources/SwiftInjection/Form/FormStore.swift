//
//  FormStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation
import SwiftUI

final class FormStore: ObservableObject {
    let viewStore: FormViewStore
    let stateSignal: StateSignal
    
    init(viewStore: FormViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
