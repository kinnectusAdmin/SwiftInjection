//
//  NavigationStackInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import SwiftUI

struct NavigationStackInsertable: View {
    @ObservedObject var store: NavigationStackStore
    var container: ViewStoresContainer
    var body: some View {
        NavigationStack(root: {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.root)
        }).addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
