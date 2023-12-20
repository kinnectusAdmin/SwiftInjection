//
//  SpacerInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//
import Foundation
import SwiftUI

public struct SpacerInsertable: View {
    @ObservedObject var store: SpacerStore
    var container: ViewStoresContainer

    public var body: some View {
        Spacer()
            .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
