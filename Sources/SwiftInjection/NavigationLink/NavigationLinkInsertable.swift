//
//  NavigationLinkInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import SwiftUI

struct NavigationLinkInsertable: View {
    @ObservedObject var store: NavigationLinkStore
    var container: ViewStoresContainer
    var body: some View {
        NavigationLink {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.destination)
        } label: {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.label)
        }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
