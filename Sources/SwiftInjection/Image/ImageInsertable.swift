//
//  ImageInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation
import SwiftUI


public struct ImageInsertable: View {
   @ObservedObject var store: ImageStore
    var container: ViewStoresContainer
    public var body: some View {
        switch store.imageResult {
        case .none:
            EmptyView()
        case let .system(name):
            Image(systemName: name)
                .addModifiers(modifiers: store.viewStore.modifiers,
                              state: store.stateSignal,
                              container: container)
        case let .local(name):
            Image(name)
                .addModifiers(modifiers: store.viewStore.modifiers,
                              state: store.stateSignal,
                              container: container)
        case let .async(url, scale, placeholder):
            if let placeholder = placeholder {
                AsyncImage(url: url, scale: CGFloat(scale)) { image in
                    image
                        .addModifiers(modifiers: store.viewStore.modifiers,
                                      state: store.stateSignal,
                                      container: container)
                } placeholder: {
                    Insertable(stateSignal: store.stateSignal, container: container, viewStore: placeholder).eraseToAnyView()
                }
            } else {
                AsyncImage(url: url, scale: CGFloat(scale))
            }
        }
    }
}
