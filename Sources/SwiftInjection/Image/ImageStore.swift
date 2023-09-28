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
    let stateSubject: StateSignal
    
    init(store: ImageViewStore, stateSubject: StateSignal) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value

        $state.map { state -> ImageResult in
            if let imageKey = store.nameKey, let name = findStringValue(stateId: state.id, id: imageKey, state: state){
                return .local(name: name)
            } else if let name = store.name {
                return .local(name: name)
            } else if let imageKey = store.systemNameKey, let systemName = findStringValue(stateId: state.id, id: imageKey, state: state) {
                return .system(name: systemName)
            } else if let systemName = store.systemName {
                return .system(name: systemName)
            } else if let urlKey = store.urlKey, let url = findStringValue(stateId: state.id, id: urlKey, state: state) {
                var scale: Double {
                    guard let scaleKey = store.scaleKey else {
                        return store.scale
                    }
                    return findDoubleValue(stateId: state.id, id: scaleKey, state: state) ?? store.scale
                }
                return .async(url: URL(string: url), scale: scale, placeholder: store.placeholder)
            } else if let url = store.url {
                var scale: Double {
                    guard let scaleKey = store.scaleKey else {
                        return store.scale
                    }
                    return findDoubleValue(stateId: state.id, id: scaleKey, state: state) ?? store.scale
                }
                return .async(url: URL(string: url), scale: scale, placeholder: store.placeholder)
            } else {
                return .system(name: "photo.artframe")
            }
        }
        .assign(to: &$imageResult)
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
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
