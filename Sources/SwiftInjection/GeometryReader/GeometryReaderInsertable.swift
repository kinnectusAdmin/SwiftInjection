//
//  GeometryReaderInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

struct GeometryReaderInsertable: View {
    
    @ObservedObject var store: GeometryReaderStore
    var container: ViewStoresContainer
    
    var body: some View {
        GeometryReader { geometry in
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.content)
        }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
