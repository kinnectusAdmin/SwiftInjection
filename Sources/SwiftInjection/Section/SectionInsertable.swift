//
//  SectionInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation
import SwiftUI

struct SectionInsertable: View {
    @ObservedObject var store: SectionStore
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
        switch store.composition {
        case .withTitle(let title):
            
            Section(title) {
                content
            }
            
        case .footer(let footer):
            Section {
                content
            } footer: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: footer)
            }
        case .header(let header):
            Section {
                content
            } header: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: header)
            }
        case .headerFooter(let header, let footer):
            Section {
                content
            } header: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: header)
            } footer: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: footer)
            }
        }
    }
}
