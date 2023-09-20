//
//  ListInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI
import Combine

public struct ListInsertable: View {
    @ObservedObject var store: ListStore
    var container: ViewStoresContainer

    public var body: some View {
        List(store.listStates, id: \.self) { itemState in
           Insertable(
            state: store.stateForItem(itemState),
            container: container,
            viewStore: store.viewStore.content)
        }
        .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
