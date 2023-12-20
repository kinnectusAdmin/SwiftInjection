//
//  SectionStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/23/23.
//

import Foundation
import SwiftUI

final class SectionStore: ObservableObject {
    let viewStore: SectionViewStore
    let stateSignal: StateSignal
    @Published var composition: SectionComposition = .withTitle(title: "")
    init(viewStore: SectionViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        
        stateSignal.eraseToAnyPublisher().map { state -> SectionComposition in
            switch viewStore.composition {
            case .header(let header):
                return .header(header)
            case .footer(let footer):
                return .footer(footer)
            case .headerFooter(let header, let footer):
                return .headerFooter(header, footer)
            case .withTitle(let titleKey, let title):
                let sectionTitle = findStringValue(stateId: state.id, id: titleKey, state: state) ?? title ?? ""
                return .withTitle(title: sectionTitle)
            }
        }.assign(to: &$composition)
        
    }
}
extension SectionStore {
    enum SectionComposition {
        case withTitle(title: String)
        case footer(InjectedView)
        case header(InjectedView)
        case headerFooter(InjectedView, InjectedView)
    }
}
