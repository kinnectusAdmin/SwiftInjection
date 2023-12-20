//
//  File.swift
//  
//
//  Created by Blake Osonduagwueki on 10/22/23.
//

import Foundation
import SwiftUI

final class GroupStore: ObservableObject {
    var viewStore: GroupViewStore
    var stateSignal: StateSignal
    
    init(viewStore: GroupViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
