//
//  LabelStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/2/23.
//

import Foundation
import Combine

final class LabelStore: ObservableObject {
    @Published private var state: InjectedState
    @Published var labelResult: LabelResult = .none
    let viewStore: LabelViewStore
    let stateSignal: StateSignal
    
    init(viewStore: LabelViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
        
        let labelTitle = $state.map { state -> String? in
            if let title = findStringValue(stateId: state.id, id: viewStore.titleKey, state: state) {
                return title
            } else if let title = viewStore.title {
                return title
            }
            return nil
        }.eraseToAnyPublisher()
        
        let localImage = $state.map { state -> String? in
            if let image = findStringValue(stateId: state.id, id: viewStore.imageKey, state: state) {
                return image
            } else if let image = viewStore.image {
                return image
            }
            return nil
        }.eraseToAnyPublisher()
        
        let systemImage = $state.map { state -> String? in
            if let image = findStringValue(stateId: state.id, id: viewStore.systemImageKey, state: state) {
                return image
            } else if let image = viewStore.systemImage {
                return image
            }
            return nil
        }.eraseToAnyPublisher()
        
        let labelLocalImage = Publishers.CombineLatest(labelTitle, localImage).map { title, image -> LabelResult in
            switch (title, image) {
            case (.some(let title), .some(let image)):
                return LabelResult.titleImage(title: title, image: image)
            default:
                return LabelResult.none
            }
        }.eraseToAnyPublisher()
            
        let labelSystemImage = Publishers.CombineLatest(labelTitle, systemImage).map { title, image -> LabelResult in
            switch (title, image) {
            case (.some(let title), .some(let image)):
                return LabelResult.titleSystemImage(title: title, systemImage: image)
            default:
                return LabelResult.none
            }
        }.eraseToAnyPublisher()
        
        let labelTitleIconView = $state.map { state  -> LabelResult in
            if let title = viewStore.titleView, let icon = viewStore.iconView {
                return LabelResult.titleIcon(title: title, icon: icon)
            }
            return .none
        }
        
        Publishers.Merge3(labelLocalImage, labelSystemImage, labelTitleIconView).filter( {$0.isValid}).assign(to: &$labelResult)
    }
}

extension LabelStore {
    indirect enum LabelResult {
        case none
        case titleImage(title: String, image: String)
        case titleSystemImage(title: String, systemImage: String)
        case titleIcon(title: InjectedView, icon: InjectedView)
        var isValid: Bool {
            switch self {
            case .titleImage, .titleSystemImage, .titleIcon:
                return true
            default:
                return false
            }
        }
    }
    
}
