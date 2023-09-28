//
//  File 2.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import SwiftUI

class TabStore: ObservableObject {
    
    var viewStore: TabViewStore
    var stateSubject: StateSignal
    
    init(viewStore: TabViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}
