//
//  EllipseInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation
import SwiftUI

struct EllipseInsertable: View {
    var store: EllipseStore
    var container: ViewStoresContainer
    var body: some View {
        
        Ellipse().addShapeModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container).eraseToAnyView()
    }
}



