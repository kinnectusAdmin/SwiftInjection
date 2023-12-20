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
