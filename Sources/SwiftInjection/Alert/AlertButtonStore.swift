//
// AlertButtonStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation
import Combine
import SwiftUI

struct AlertButtonStore {
    var container: ViewStoresContainer
    var state: CurrentValueSubject<InjectedState, Never>
    var alertButton: AlertButton
    
    var render: Alert.Button {
        switch alertButton {
        case .cancel(let label, let action):
            let labelTextStore = TextStore(stateSubject: state, store: label)
            return Alert.Button.cancel(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  state: state,
                                  container: container) as? Text ?? Text(labelTextStore.text)
            ) {
                //Perform operation associated with textStore
                if let action = action {
                    didCommitAction(operation: action)
                }
            }
        case .default(let label, let action):
            let labelTextStore = TextStore(stateSubject: state, store: label)
            return Alert.Button.default(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  state: state,
                                  container: container) as? Text ?? Text(labelTextStore.text)
            ) {
                //Perform operation associated with textStore
                if let action = action {
                    didCommitAction(operation: action)
                }
            }
        case .destructive(let label, let action):
            let labelTextStore = TextStore(stateSubject: state, store: label)
            return Alert.Button.destructive(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  state: state,
                                  container: container) as? Text ?? Text(labelTextStore.text)
            ) {
                //Perform operation associated with textStore
                if let action = action {
                    didCommitAction(operation: action)
                }
            }
        }
    }
    
    private func didCommitAction(operation: InjectedOperation) {
        if let state = InjectedFunctionBuilder(state: state, operation: operation).state?.value {
            self.state.send(state)
        }
    }
}
