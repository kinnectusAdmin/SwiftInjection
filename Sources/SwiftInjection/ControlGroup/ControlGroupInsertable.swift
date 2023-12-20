//
//  ControlGroupInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

struct ControlGroupInsertable: View {
    @ObservedObject var store: ControlGroupStore
    var container: ViewStoresContainer
    var content: some View {
        Group {
            Insertable(stateSignal: store.stateSignal, container: container, viewStore: store.viewStore.content.content1).eraseToAnyView()
            
            if let content = store.viewStore.content.content2 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content3 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content4 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content5 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content6 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content7 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content8 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content9 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
            if let content = store.viewStore.content.content10 {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: content).eraseToAnyView()
            }
        }
    }
    var body: some View {
        switch store.viewStore.composition {
        case .standard:
            ControlGroup {
                content
            }
        case .withLabel(let viewStore):
            ControlGroup {
                content
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: viewStore).eraseToAnyView()
            }

//        case .withConfiguration(let configuration):
//            ControlGroup(configuration.render)
        }
    }
}
