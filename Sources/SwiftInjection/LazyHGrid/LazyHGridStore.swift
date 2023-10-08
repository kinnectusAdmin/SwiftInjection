//
//  LazyHGridStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

final class LazyHGridStore: ObservableObject {
    let viewStore: LazyHGridViewStore
    let stateSubject: StateSignal
    var gridComposition: LazyHGridComposition
    
    init(viewStore: LazyHGridViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
        
        if let spacing = viewStore.spacing {
            self.gridComposition = .rows_alignment_spacing_pinnedViews(viewStore.rows, alignment: viewStore.verticalAlignment, spacing: spacing, pinnedViews: viewStore.pinnedViews)
        } else {
            self.gridComposition = .rows_alignment_pinnedViews(viewStore.rows, alignment: viewStore.verticalAlignment, pinnedViews: viewStore.pinnedViews)
        }
    }
    
}
extension LazyHGridStore {
    enum LazyHGridComposition {
        case rows_alignment_spacing_pinnedViews([InjectedGridItem], alignment: InjectedVerticalAlignment, spacing: Double, pinnedViews: InjectedPinnedScrollableViews)
        case rows_alignment_pinnedViews([InjectedGridItem], alignment: InjectedVerticalAlignment, pinnedViews: InjectedPinnedScrollableViews)
    }
}
