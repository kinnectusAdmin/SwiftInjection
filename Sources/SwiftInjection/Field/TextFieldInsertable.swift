//
//  TextFieldInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

public struct TextFieldInsertable: View {
    @ObservedObject var store: TextFieldStore
    var container: ViewStoresContainer

    public var body: some View {
        TextField("Email",text: store.textBinding)
            .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
