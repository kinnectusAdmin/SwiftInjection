//
//  ImageStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation
import Combine

class ImageStore: ObservableObject {
    @Published var state: InjectedState
    @Published var imageResult: ImageResult = .none
    let viewStore: ImageViewStore
    let stateSignal: StateSignal
    
    init(viewStore: ImageViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value

        $state.map { state -> ImageResult in
            if let imageKey = viewStore.nameKey, let name = findStringValue(stateId: state.id, id: imageKey, state: state){
                return .local(name: name)
            } else if let name = viewStore.name {
                return .local(name: name)
            } else if let imageKey = viewStore.systemNameKey, let systemName = findStringValue(stateId: state.id, id: imageKey, state: state) {
                return .system(name: systemName)
            } else if let systemName = viewStore.systemName {
                return .system(name: systemName)
            } else if let urlKey = viewStore.urlKey, let url = findStringValue(stateId: state.id, id: urlKey, state: state) {
                var scale: Double {
                    guard let scaleKey = viewStore.scaleKey else {
                        return viewStore.scale
                    }
                    return findDoubleValue(stateId: state.id, id: scaleKey, state: state) ?? viewStore.scale
                }
                return .async(url: URL(string: url), scale: scale, placeholder: viewStore.placeholder)
            } else if let url = viewStore.url {
                var scale: Double {
                    guard let scaleKey = viewStore.scaleKey else {
                        return viewStore.scale
                    }
                    return findDoubleValue(stateId: state.id, id: scaleKey, state: state) ?? viewStore.scale
                }
                return .async(url: URL(string: url), scale: scale, placeholder: viewStore.placeholder)
            } else {
                return .system(name: "photo.artframe")
            }
        }
        .assign(to: &$imageResult)
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
    }
}

extension ImageStore {
    enum ImageResult {
        case none
        case system(name: String)
        case local(name: String)
        case async(url: URL?, scale: Double, placeholder: InjectedView?)
    }
}
