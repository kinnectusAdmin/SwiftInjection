//
//  LazyVGridInsertable.swift
//
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

struct LazyVGridInsertable: View {
    var store: LazyVGridStore
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
        case let .columns_alignment_pinnedViews(columns, alignment, pinnedViews):
            LazyVGrid(columns: columns.map { $0.render },
                      alignment: alignment.render,
                      pinnedViews: pinnedViews.render) {
                gridContent
            }
        case let .columns_alignment_spacing_pinnedViews(columns, alignment, spacing, pinnedViews):
            LazyVGrid(columns: columns.map { $0.render},
                      alignment: alignment.render,
                      spacing: CGFloat(spacing),
                      pinnedViews: pinnedViews.render) {
                gridContent
            }
        }
        
        
    }
}
