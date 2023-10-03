//
//  LabelInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/2/23.
//

import Foundation
import SwiftUI

struct LabelInsertable: View {
    @ObservedObject var store: LabelStore
    var container: ViewStoresContainer
    var body: some View {
        switch store.labelResult {
        case let .titleImage(title, image):
            
            Label(title, image: image)
                .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .titleSystemImage(title, systemImage):
            
            Label(title, systemImage: systemImage)
                .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            
        case let .titleIcon(title, icon):
            
            Label {
                
                Insertable(state: store.stateSubject, container: container, viewStore: title)
                    .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            } icon: {
                
                Insertable(state: store.stateSubject, container: container, viewStore: icon)
                    .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
            }

        case .none:
            EmptyView()
        }
    }
}
