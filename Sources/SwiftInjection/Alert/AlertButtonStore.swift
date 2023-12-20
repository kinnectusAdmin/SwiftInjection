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
    var stateSignal: StateSignal
    var alertButton: AlertButton
    
    var render: Alert.Button {
        switch alertButton {
        case .cancel(let label, let action):
            let labelTextStore = TextStore(viewStore: label, stateSignal: stateSignal)
            return Alert.Button.cancel(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  stateSignal: stateSignal,
                                  container: container) as? Text ?? Text(labelTextStore.text)
            ) {
                //Perform operation associated with textStore
                if let action = action {
                    didCommitAction(operation: action)
                }
            }
        case .default(let label, let action):
            let labelTextStore = TextStore(viewStore: label, stateSignal: stateSignal)
            return Alert.Button.default(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  stateSignal: stateSignal,
                                  container: container) as? Text ?? Text(labelTextStore.text)
            ) {
                //Perform operation associated with textStore
                if let action = action {
                    didCommitAction(operation: action)
                }
            }
        case .destructive(let label, let action):
            let labelTextStore = TextStore(viewStore: label, stateSignal: stateSignal)
            return Alert.Button.destructive(
                Text(labelTextStore.text)
                    .addModifiers(mods: labelTextStore.viewStore.modifiers,
                                  stateSignal: stateSignal,
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
        if let state = InjectedFunctionBuilder(stateSignal: stateSignal, operation: operation).stateSignal?.value {
            self.stateSignal.send(state)
        }
    }
}
