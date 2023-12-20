//
//  GeometryReaderStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation
import SwiftUI

final class GeometryReaderStore: ObservableObject {
    let viewStore: GeometryReaderViewStore
    let stateSignal: StateSignal
    
    init(viewStore: GeometryReaderViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
    }
    
    func stateForGeometryProxy(geometry: GeometryProxy) -> StateSignal {
        stateSignal
            .appending(values:
                        InjectedValue.double(stateId: stateSignal.value.id,
                                             id: viewStore.geometryProxyWidthKey,
                                             value: Double(geometry.size.width)),
                       InjectedValue.double(stateId: stateSignal.value.id,
                                            id: viewStore.geometryProxyHeightKey,
                                            value: Double(geometry.size.height)),
                       InjectedValue.double(stateId: stateSignal.value.id,
                                            id: viewStore.geometryProxyBottomKey,
                                            value: Double(geometry.safeAreaInsets.bottom)),
                       InjectedValue.double(stateId: stateSignal.value.id,
                                            id: viewStore.geometryProxyTopKey,
                                            value: Double(geometry.safeAreaInsets.top)),
                       InjectedValue.double(stateId: stateSignal.value.id,
                                            id: viewStore.geometryProxyLeadingKey,
                                            value: Double(geometry.safeAreaInsets.leading)),
                       InjectedValue.double(stateId: stateSignal.value.id,
                                            id: viewStore.geometryProxyTrailingKey,
                                            value: Double(geometry.safeAreaInsets.trailing))
            )
    }
}

