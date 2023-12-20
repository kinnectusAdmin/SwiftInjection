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
                .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .titleSystemImage(title, systemImage):
            
            Label(title, systemImage: systemImage)
                .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .titleIcon(title, icon):
            
            Label {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: title)
                    .eraseToAnyView()
                    .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container).eraseToAnyView()
            } icon: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: icon)
                    .eraseToAnyView()
                    .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container).eraseToAnyView()
            }

        case .none:
            EmptyView()
        }
    }
}
