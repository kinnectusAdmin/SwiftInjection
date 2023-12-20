//
//  TabStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import SwiftUI

class TabStore: ObservableObject {
    
    var viewStore: TabViewStore
    var stateSignal: StateSignal
    
    init(viewStore: TabViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
}
