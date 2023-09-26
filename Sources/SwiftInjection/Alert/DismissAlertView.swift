//
//  File.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation
import SwiftUI
import Combine

public struct DismissAlertView {
    var viewStore: DismissAlertViewStore
    var state: CurrentValueSubject<InjectedState, Never>
    var container: ViewStoresContainer
    var titleStore: TextStore {
        .init(stateSubject: state, store: viewStore.title)
    }
    var titleModifiers: [InjectedModifier] {
        viewStore.title.modifiers
    }
    var messageStore: TextStore {
        .init(stateSubject: state, store: viewStore.message)
    }
    var messageModifiers: [InjectedModifier] {
        viewStore.message.modifiers
    }
    var dismissButton: AlertButtonStore {
        AlertButtonStore(container: container,
                         state: state,
                         alertButton: viewStore.button)
    }

    var title: Text {
        (Text(titleStore.text).addModifiers(mods: titleStore.viewStore.modifiers, state: titleStore.stateSubject, container: container) as? Text) ?? Text(titleStore.text)
    }
    var message: Text {
        (Text(messageStore.text).addModifiers(mods: messageStore.viewStore.modifiers, state: messageStore.stateSubject, container: container) as? Text) ?? Text(messageStore.text)
    }
    
    var render: Alert {
        Alert(title: title,
              message: message,
              dismissButton: dismissButton.render)
    }
    
}
