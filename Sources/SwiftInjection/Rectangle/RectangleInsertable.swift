//
//  RectangleInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/3/23.
//

import Foundation
import SwiftUI

struct RectangleInsertable: View {
    @ObservedObject var store: RectangleStore
    var container: ViewStoresContainer
    var body: some View {
        Rectangle().addShapeModifiers(modifiers: store.viewStore.modifiers, state: store.stateSignal, container: container).eraseToAnyView()
    }
}
