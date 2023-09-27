//
//  AlertInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 9/25/23.
//
import Foundation
import SwiftUI
import Combine

struct PrimarySecondaryAlertView {
    var viewStore: PrimarySecondaryAlertViewStore
    var state: StateSignal
    var container: ViewStoresContainer
    var titleStore: TextStore {
        .init(stateSubject: state, store: viewStore.title)
    }
    private var titleModifiers: [InjectedModifier] {
        viewStore.title.modifiers
    }
    private var messageStore: TextStore {
        .init(stateSubject: state, store: viewStore.message)
    }
    private var messageModifiers: [InjectedModifier] {
        viewStore.message.modifiers
    }
    private var primaryAlertButton: AlertButtonStore {
        AlertButtonStore(container: container, state: state, alertButton: viewStore.primary)
    }
    private var secondaryAlertButton: AlertButtonStore {
        AlertButtonStore(container: container, state: state, alertButton: viewStore.secondary)
    }

    private var title: Text {
        (Text(titleStore.text).addModifiers(mods: titleStore.viewStore.modifiers, state: titleStore.stateSubject, container: container) as? Text) ?? Text(titleStore.text)
    }
    private var message: Text {
        (Text(messageStore.text).addModifiers(mods: messageStore.viewStore.modifiers, state: messageStore.stateSubject, container: container) as? Text) ?? Text(messageStore.text)
    }
    
    var render: Alert {
        Alert(title: title,
              message: message,
              primaryButton: primaryAlertButton.render,
              secondaryButton: secondaryAlertButton.render)
    }
    
}
