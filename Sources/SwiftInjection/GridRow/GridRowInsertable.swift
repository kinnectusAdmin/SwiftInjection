//
//  GridRowInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI


struct GridRowInsertable: View {
    @ObservedObject var store: GridRowStore
    var container: ViewStoresContainer
    var gridRowContent: some View {
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
        switch store.gridRowComposition {
        case .standard:
            GridRow {
                gridRowContent
            }
        case .alignment(let alignment):
            GridRow(alignment: alignment.render) {
                gridRowContent
            }
        }
        
    }
}
