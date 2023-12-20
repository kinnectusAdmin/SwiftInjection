//
//  ButtonInsertable.swift
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

public struct ButtonInsertable: View {
    var container: ViewStoresContainer
    @ObservedObject var store: ButtonStore

    public var body: some View {
        Button(action: {
            store.didCommitAction()
        }, label: {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.content)
        }).addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}

