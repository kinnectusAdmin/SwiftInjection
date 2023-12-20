//
//  LazyVGridStore.swift
//
//
//  Created by Blake Osonduagwueki on 10/6/23.
//

import Foundation
import SwiftUI

final class LazyVGridStore: ObservableObject {
    let viewStore: LazyVGridViewStore
    let stateSignal: StateSignal
    var gridComposition: LazyVGridComposition
    
    init(viewStore: LazyVGridViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        
        if let spacing = viewStore.spacing {
            self.gridComposition = .columns_alignment_spacing_pinnedViews(viewStore.columns, alignment: viewStore.horizontalAlignment, spacing: spacing, pinnedViews: viewStore.pinnedViews)
        } else {
            self.gridComposition = .columns_alignment_pinnedViews(viewStore.columns, alignment: viewStore.horizontalAlignment, pinnedViews: viewStore.pinnedViews)
        }
    }
}

extension LazyVGridStore {
    enum LazyVGridComposition {
        case columns_alignment_spacing_pinnedViews([InjectedGridItem], alignment: InjectedHorizontalAlignment, spacing: Double, pinnedViews: InjectedPinnedScrollableViews)
        case columns_alignment_pinnedViews([InjectedGridItem], alignment: InjectedHorizontalAlignment, pinnedViews: InjectedPinnedScrollableViews)
    }
}
