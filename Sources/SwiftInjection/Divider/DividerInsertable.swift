//
//  DividerInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/8/23.
//

import Foundation
import SwiftUI

struct DividerInsertable: View {
    @ObservedObject var store: DividerStore
    var container: ViewStoresContainer
    
    var body: some View {
        Divider().addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
