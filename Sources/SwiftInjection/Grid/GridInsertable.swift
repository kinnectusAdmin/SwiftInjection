//
//  GridInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

struct GridInsertable: View {
    var store: GridStore
    var container: ViewStoresContainer
    var gridContent: some View {
        Group {
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
        }
    }
    var body: some View {
        switch store.gridComposition {
        case let .alignment_horizontal_verticalSpacing(alignment, horizontalSpacing, verticalSpacing):
            Grid(alignment: alignment.render, horizontalSpacing: CGFloat(horizontalSpacing), verticalSpacing: CGFloat(verticalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .alignment_horizontalSpacing(alignment, horizontalSpacing):
            Grid(alignment: alignment.render, horizontalSpacing: CGFloat(horizontalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .alignment_verticalSpacing(alignment, verticalSpacing):
            Grid(alignment: alignment.render, verticalSpacing: CGFloat(verticalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .horizontal_verticalSpacing(horizontalSpacing, verticalSpacing):
            Grid(horizontalSpacing: CGFloat(horizontalSpacing), verticalSpacing: CGFloat(verticalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .verticalSpacing(verticalSpacing):
            Grid(verticalSpacing: CGFloat(verticalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .horizontalSpacing(horizontalSpacing):
            Grid(horizontalSpacing: CGFloat(horizontalSpacing)) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case let .alignment(alignment):
            Grid(alignment: alignment.render) {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        case .standard:
            Grid {
                gridContent
            }.addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        }
    }
}
