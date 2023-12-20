//
//  IfInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
import SwiftUI

public struct IfInsertable: View {
    @ObservedObject var store: IfStore
    var container: ViewStoresContainer
    
    public var body: some View {
        if store.condition {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.content)
        }
    }
}
