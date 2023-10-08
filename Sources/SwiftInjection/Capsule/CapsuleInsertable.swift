//
//  CapsuleInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/5/23.
//

import Foundation
import SwiftUI

struct CapsuleInsertable: View {
    @ObservedObject var store: CapsuleStore
    var container: ViewStoresContainer
    var body: some View {
        if let style = store.viewStore.style {
            
            Capsule(style: style.render)
                .addShapeModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container)
                .eraseToAnyView()

        } else {
            
            Capsule()
                .addShapeModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container)
                .eraseToAnyView()
        }
    }
}
