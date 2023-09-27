//
//  InjectedViewStoreAddModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/13/23.
//

import Foundation

public extension InjectedView {
    
    func addModifier(modifier: InjectedModifier) -> InjectedView {
        switch self {
        case .viewStoreReference, .if, .empty:
            return self
        case .vStack(let viewStore):
            return .vStack(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .hStack(let viewStore):
            return .hStack(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .zStack(let viewStore):
            return .zStack(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .list(let viewStore):
            return .list(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), listKey: viewStore.listKey, content: viewStore.content))
        case .forEach(let viewStore):
            return .forEach(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), forEachKey: viewStore.forEachKey, content: viewStore.content))
        case .text(let viewStore):
            return .text(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), textKey: viewStore.textKey))
        case .field(let viewStore):
            return .field(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), textKey: viewStore.textKey))
        case .button(let viewStore):
            return .button(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), operation1: viewStore.operation1, operation2: viewStore.operation2, operation3: viewStore.operation3, operation4: viewStore.operation4, operation5: viewStore.operation5, operation6: viewStore.operation6, operation7: viewStore.operation7, operation8: viewStore.operation8, operation9: viewStore.operation9, operation10: viewStore.operation10, content: viewStore.content))
        case .namedImage(let viewStore):
            return .namedImage(store: .init(id: viewStore.id, name: viewStore.name, systemName: viewStore.systemName, modifiers: viewStore.modifiers.appending(modifier)))
        case .systemImage(let viewStore):
            return .systemImage(store: .init(id: viewStore.id, name: viewStore.name, systemName: viewStore.systemName, modifiers: viewStore.modifiers.appending(modifier)))
        case .navigationStack(let viewStore):
            return .navigationStack(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), root: viewStore.root))
        case .navigationLink(let viewStore):
            return .navigationLink(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), destination: viewStore.destination, label: viewStore.label))
        case .color(let viewStore):
            return .color(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), colorKey: viewStore.colorKey))
        case .spacer(let viewStore):
            return .spacer(store: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier)))
        
        }
    }
}

