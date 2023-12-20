//
//  DismissAlertView.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation
import SwiftUI
import Combine

public struct DismissAlertView {
    var viewStore: DismissAlertViewStore
    var state: StateSignal
    var container: ViewStoresContainer
    var titleStore: TextStore {
        .init(viewStore: viewStore.title, stateSignal: state)
    }
    var titleModifiers: [InjectedModifier] {
        viewStore.title.modifiers
    }
    var messageStore: TextStore {
        .init(viewStore: viewStore.message, stateSignal: state)
    }
    var messageModifiers: [InjectedModifier] {
        viewStore.message.modifiers
    }
    var dismissButton: AlertButtonStore {
        AlertButtonStore(container: container,
                         stateSignal: state,
                         alertButton: viewStore.button)
    }

    var title: Text {
        (Text(titleStore.text).addModifiers(mods: titleStore.viewStore.modifiers, stateSignal: titleStore.stateSignal, container: container) as? Text) ?? Text(titleStore.text)
    }
    var message: Text {
        (Text(messageStore.text).addModifiers(mods: messageStore.viewStore.modifiers, stateSignal: messageStore.stateSignal, container: container) as? Text) ?? Text(messageStore.text)
    }
    
    var render: Alert {
        Alert(title: title,
              message: message,
              dismissButton: dismissButton.render)
    }
    
}
