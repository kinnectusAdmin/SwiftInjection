//
//  RoundedRectangleInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation
import SwiftUI

struct RoundedRectangleInsertable: View {
    @ObservedObject var store: RoundedRectangleStore
    var container: ViewStoresContainer
    var body: some View {
        switch  store.roundedRectangleResult {
        case let .cornerRadius(radius):
            
            RoundedRectangle(cornerRadius: CGFloat(radius))
                .addRectangleModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container).eraseToAnyView()
            
        case let .cornerRadius_Style(radius, style):
            
            RoundedRectangle(cornerRadius: CGFloat(radius), style: style.render)
                .addRectangleModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container).eraseToAnyView()

        case let .sizeWidth_Height(width, height):
       
            RoundedRectangle(cornerSize: .init(width: CGFloat(width), height: CGFloat(height)))
                .addRectangleModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container).eraseToAnyView()
            
        case let .sizeWidth_Height_Style(width, height, style):
            
            RoundedRectangle(cornerSize: .init(width: CGFloat(width), height: CGFloat(height)), style: style.render)
                .addRectangleModifiers(modifiers: store.viewStore.modifiers, state: store.stateSubject, container: container).eraseToAnyView()

        }
    }
}

