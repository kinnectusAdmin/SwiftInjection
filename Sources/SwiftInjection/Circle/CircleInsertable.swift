//
//  CircleInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation
import SwiftUI

struct CircleInsertable: View {
    @ObservedObject var store: CircleStore
    var container: ViewStoresContainer
    var body: some View {
        Circle().addShapeModifiers(modifiers: store.viewStore.modifiers, state: store.stateSignal, container: container).eraseToAnyView()
    }
}

