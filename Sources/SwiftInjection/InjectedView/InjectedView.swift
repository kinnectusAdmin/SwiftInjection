//
//  InjectedViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine

indirect public enum InjectedView: Codable, Hashable {
   
    static public func == (lhs: InjectedView, rhs: InjectedView) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    case vStack(viewStore: VStackViewStore)
    case hStack(viewStore: HStackViewStore)
    case zStack(viewStore: ZStackViewStore)
    case lazyVStack(viewStore: VStackViewStore)
    case lazyHStack(viewStore: HStackViewStore)
    case list(viewStore: ListViewStore)
    case forEach(viewStore: ForEachViewStore)
    case text(viewStore: TextViewStore)
    case field(viewStore: FieldViewStore)
    case secureField(viewStore: SecureFieldViewStore)
    case label(viewStore: LabelViewStore)
    case button(viewStore: ButtonViewStore)
    case namedImage(viewStore: ImageViewStore)
    case systemImage(viewStore: ImageViewStore)
    case asyncImage(viewStore: ImageViewStore)
    case navigationStack(viewStore: NavigationStackViewStore)
    case navigationLink(viewStore:  NavigationLinkViewStore)
    case tab(viewStore: TabViewStore)
    case color(viewStore: ColorViewStore)
    case spacer(viewStore: SpacerViewStore)
    case `if`(viewStore: IfViewStore)
    // case `ifLet`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore)
    // case `switch`(  conditionKey: String,
    //                 modifiers: [InjectedModifier],
    //                 caseContent1: InjectedViewStore,
    //                 caseContent2: InjectedViewStore,
    //                 caseContent3: InjectedViewStore,
    //                 caseContent4: InjectedViewStore,
    //                 caseContent5: InjectedViewStore,
    //                 caseContent6: InjectedViewStore,
    //                 caseContent7: InjectedViewStore,
    //                 caseContent8: InjectedViewStore,
    //                 caseContent9: InjectedViewStore,
    //                 caseContent10: InjectedViewStore)
    // case `ifElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifLetElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifElseIfElese`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseIfContent: InjectedViewStore, elseContent: InjectedViewStore)
    case viewStoreReference(id: String)
    case empty(id: String = "")
    public var id: String {
        switch self {
        case .viewStoreReference(let id), .empty(let id):
            return id
        case .vStack(let viewStore):
            return viewStore.id
        case .hStack(let viewStore):
            return viewStore.id
        case .zStack(let viewStore):
            return viewStore.id
        case .lazyVStack(let viewStore):
            return viewStore.id
        case .lazyHStack(let viewStore):
            return viewStore.id
        case .list(let viewStore):
            return viewStore.id
        case .forEach(let viewStore):
            return viewStore.id
        case .text(let viewStore):
            return viewStore.id
        case .field(let viewStore):
            return viewStore.id
        case .secureField(let viewStore):
            return viewStore.id
        case .label(let viewStore):
            return viewStore.id
        case .button(let viewStore):
            return viewStore.id
        case .namedImage(let viewStore):
            return viewStore.id
        case .systemImage(let viewStore):
            return viewStore.id
        case .asyncImage(let viewStore):
            return viewStore.id
        case .navigationStack(let viewStore):
            return viewStore.id
        case .navigationLink(let viewStore):
            return viewStore.id
        case .tab(let viewStore):
            return viewStore.id
        case .color(let viewStore):
            return viewStore.id
        case .spacer(let viewStore):
            return viewStore.id
        case .if(let viewStore):
            return viewStore.id
        }
    }
}
