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
            return .vStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .hStack(let viewStore):
            return .hStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .zStack(let viewStore):
            return .zStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .list(let viewStore):
            return .list(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), listKey: viewStore.listKey, content: viewStore.content))
        case .forEach(let viewStore):
            return .forEach(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), forEachKey: viewStore.forEachKey, content: viewStore.content))
        case .text(let viewStore):
            return .text(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), textKey: viewStore.textKey))
        case .field(let viewStore):
            return .field(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), textKey: viewStore.textKey))
        case .secureField(let viewStore):
            return .secureField(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), textKey: viewStore.textKey))
        case .label(let viewStore):
            return .label(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), titleKey: viewStore.titleKey, imageKey: viewStore.imageKey, systemImageKey: viewStore.imageKey, titleView: viewStore.titleView, iconView: viewStore.iconView, title: viewStore.title, image: viewStore.image, systemImage: viewStore.systemImage))
        case .button(let viewStore):
            return .button(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), operation1: viewStore.operation1, operation2: viewStore.operation2, operation3: viewStore.operation3, operation4: viewStore.operation4, operation5: viewStore.operation5, operation6: viewStore.operation6, operation7: viewStore.operation7, operation8: viewStore.operation8, operation9: viewStore.operation9, operation10: viewStore.operation10, content: viewStore.content))
        case .namedImage(let viewStore):
            return .namedImage(viewStore: .init(id: viewStore.id, name: viewStore.name, systemName: viewStore.systemName, modifiers: viewStore.modifiers.appending(modifier)))
        case .systemImage(let viewStore):
            return .systemImage(viewStore: .init(id: viewStore.id, name: viewStore.name, systemName: viewStore.systemName, modifiers: viewStore.modifiers.appending(modifier)))
        case .asyncImage(let viewStore):
            return .asyncImage(viewStore: .init(id: viewStore.id, nameKey: viewStore.nameKey, name: viewStore.name, systemNameKey: viewStore.systemNameKey, systemName: viewStore.systemName, urlKey: viewStore.urlKey, url: viewStore.url, scaleKey: viewStore.scaleKey, scale: viewStore.scale, placeholder: viewStore.placeholder, modifiers: viewStore.modifiers.appending(modifier)))
        case .tab(let viewStore):
            return .tab(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), content1: viewStore.content1, content2: viewStore.content1, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5 , content6: viewStore.content6 , content7: viewStore.content7 , content8: viewStore.content8 , content9: viewStore.content9 , content10: viewStore.content10))
        case .navigationStack(let viewStore):
            return .navigationStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), root: viewStore.root))
        case .navigationLink(let viewStore):
            return .navigationLink(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), destination: viewStore.destination, label: viewStore.label))
        case let .lazyVStack(viewStore):
            return .lazyVStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case let .lazyHStack(viewStore):
            return .lazyHStack(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
        case .color(let viewStore):
            return .color(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier), colorKey: viewStore.colorKey))
        case .spacer(let viewStore):
            return .spacer(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers.appending(modifier)))
        }
    }
}

