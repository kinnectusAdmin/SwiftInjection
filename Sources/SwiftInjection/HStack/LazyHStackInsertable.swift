
//
//  LazyHStackInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/28/23.
//

import Foundation
import SwiftUI

public struct LazyHStackInsertable: View {
    
    @ObservedObject var store: HStackStore
    var container: ViewStoresContainer
    
    public var body: some View {
        LazyHStack(alignment: store.alignment, spacing: store.spacing) {
            
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content1)
            
            if let content = store.viewStore.content2 {
                    Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content3 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content4 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content5 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content6 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content7 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content8 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content9 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content10 {
                Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
        }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}

