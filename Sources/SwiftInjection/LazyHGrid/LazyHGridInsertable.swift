//
//  LazyHGridInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

struct LazyHGridInsertable: View {
    @ObservedObject var store: LazyHGridStore
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
        case let .rows_alignment_pinnedViews(rows, alignment, pinnedScrollableViews):
            LazyHGrid(rows: rows.map { $0.render },
                      alignment: alignment.render,
                      pinnedViews: pinnedScrollableViews.render) {
                gridContent
            }
        case let .rows_alignment_spacing_pinnedViews(rows, alignment, spacing, pinnedScrollableViews):
            LazyHGrid(rows: rows.map { $0.render},
                      alignment: alignment.render,
                      spacing: CGFloat(spacing),
                      pinnedViews: pinnedScrollableViews.render) {
                gridContent
            }
        }
        
        
    }
}
