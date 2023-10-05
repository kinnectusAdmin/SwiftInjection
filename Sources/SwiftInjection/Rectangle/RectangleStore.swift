//
//  RectangleStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/4/23.
//

import Foundation

final class RectangleStore: ObservableObject {
    let viewStore: RectangleViewStore, stateSubject: StateSignal
    
    init(viewStore: RectangleViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
    }
}

final class RoundedRectangleStore: ObservableObject {
    let viewStore: RoundedRectangleViewStore
    let stateSubject: StateSignal
    @Published var state: InjectedState
    @Published var roundedRectangleResult: RoundedRectangleResult = .cornerRadius(0)
    
    init(viewStore: RoundedRectangleViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.state = stateSubject.value
        self.stateSubject = stateSubject
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state -> RoundedRectangleResult in
            
            if let referencedCornerRadius = findDoubleValue(stateId: state.id, id: viewStore.widthKey, state: state) {
                guard let style = viewStore.style else {
                    return .cornerRadius(referencedCornerRadius)
                }
                return .cornerRadius_Style(referencedCornerRadius, style)
            }
            
            if let cornerRadius = viewStore.cornerRadius {
                guard let style = viewStore.style else {
                    return .cornerRadius(cornerRadius)
                }
                return .cornerRadius_Style(cornerRadius, style)
            }
            
            if let referencedWidth = findDoubleValue(stateId: state.id, id: viewStore.widthKey, state: state), let referencedHeight = findDoubleValue(stateId: state.id, id: viewStore.heightKey, state: state)  {
                guard let style = viewStore.style  else {
                    return .sizeWidth_Height(referencedWidth, referencedHeight)
                }
                return .sizeWidth_Height_Style(referencedWidth, referencedHeight, style)
            }
            
            
            if let width = viewStore.width, let height = viewStore.height{
                guard let style = viewStore.style  else {
                    return .sizeWidth_Height(width, height)
                }
                return .sizeWidth_Height_Style(width, height, style)
            }
            
            if let width = viewStore.width, let referencedHeight = findDoubleValue(stateId: state.id, id: viewStore.heightKey, state: state) {
                guard let style = viewStore.style  else {
                    return .sizeWidth_Height(width, referencedHeight)
                }
                return .sizeWidth_Height_Style(width, referencedHeight, style)
            }
            
            if let referencedWidth = findDoubleValue(stateId: state.id, id: viewStore.widthKey, state: state), let height = viewStore.height{
                guard let style = viewStore.style  else {
                    return .sizeWidth_Height(referencedWidth, height)
                }
                return .sizeWidth_Height_Style(referencedWidth, height, style)
            }
            return .cornerRadius(0)
        }.assign(to: &$roundedRectangleResult)
    }
}

extension RoundedRectangleStore {
    enum RoundedRectangleResult {
    case cornerRadius(Double)
    case sizeWidth_Height(Double, Double)
    case sizeWidth_Height_Style(Double, Double, InjectedRoundedCornerStyle)
    case cornerRadius_Style(Double, InjectedRoundedCornerStyle)
    }
}
