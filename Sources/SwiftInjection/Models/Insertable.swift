//
//  Insertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/16/23.
//

import Foundation
import SwiftUI
import WebKit
import Combine

public struct Insertable: View {
    
    var state: StateSignal
    var container: ViewStoresContainer
    var viewStore: InjectedView
    
public init(state: StateSignal,
         container: ViewStoresContainer,
         viewStore: InjectedView) {
        self.state = state
        self.container = container
        self.viewStore = viewStore
    }
    @ViewBuilder var render: some View {
        switch viewStore {

        case .vStack(let viewStore):

            VStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)

        case .hStack(let viewStore):

            HStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)

        case .zStack(let viewStore):

            ZStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)

        case .list(let viewStore):

            ListInsertable(
                store: .init(viewStore: viewStore, stateSubject: state),
                container: container)

        case .forEach(let viewStore):
            
            ForEachInsertable(
                store: .init(viewStore: viewStore, stateSubject: state),
                container: container)

        case .button(let viewStore):

            ButtonInsertable(container: container, store: .init(store: viewStore, stateSubject: state))

        case .text(let viewStore):

            TextInsertable(store: .init(stateSubject: state, store: viewStore), container: container)

        case .field(let viewStore):

            TextFieldInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
        
        case .secureField(let viewStore):

            SecureFieldInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
            
        case .label(let viewStore):
            
            LabelInsertable(store: .init(viewStore: viewStore, stateSubject: state), container: container)
            
        case .namedImage(let viewStore), .systemImage(let viewStore), .asyncImage(let viewStore):

            ImageInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
      
        case .tab(let viewStore):
            
            TabInsertable(store: .init(viewStore: viewStore, stateSubject: state), container: container)
            
        case .navigationStack(let viewStore):
            
            NavigationStackInsertable(store: .init(viewStore: viewStore, stateSubject: state), container: container)
            
        case .navigationLink(let viewStore):
            
            NavigationLinkInsertable(store: .init(viewStore: viewStore, stateSubject: state), container: container)
            
        case .color(let viewStore):

            ColorInsertable(store: .init(store: viewStore, state: state), container: container)
            
        case .rectangle(let viewStore):
            
            RectangleInsertable(store: .init(viewStore: viewStore, stateSubject: state), container: container)
            
        case .spacer(let viewStore):

            SpacerInsertable(store: .init(store: viewStore, stateSubject: state), container: container)

        case .if(let viewStore):

            IfInsertable(store: .init(store: viewStore, stateSubject: state), container: container)

        case .viewStoreReference(let id):
            
            if let viewStore = container.viewStores.first(where: {$0.id == id })  {
                Insertable(state: state, container: container, viewStore: viewStore)
            }

        case .empty:
            
            EmptyView()
            
        case let .lazyVStack(viewStore):
            
            LazyVStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)

        case let .lazyHStack(viewStore):
            
            LazyHStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)
            
        }
    }
    
    public var body: some View {
        render
    }
}
