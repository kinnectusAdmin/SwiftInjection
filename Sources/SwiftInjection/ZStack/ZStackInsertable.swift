//
//  ZStackInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//

import Foundation
import SwiftUI
import Combine


public struct ZStackInsertable: View {
    @ObservedObject var store: ZStackStore
    var container: ViewStoresContainer
    
    public var body: some View {
        ZStack(alignment: store.alignment){
            
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.content1).eraseToAnyView()
            
            if let content = store.viewStore.content2 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content3 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content4 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content5 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content6 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content7 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content8 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content9 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content10 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
        }
        .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}
