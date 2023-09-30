//
//  SecureFieldInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 9/29/23.
//

import Foundation
import SwiftUI

struct SecureFieldInsertable: View {
    var store: SecureFieldStore
    var container: ViewStoresContainer
    
    var body: some View {
        SecureField(store.title, text: store.textBinding, prompt: Text(store.prompt))
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}

struct SecureFieldInsertable_Previews: PreviewProvider {
    static var previews: some View {
        let stateId: String = "state"
        let textKey: String = "text"
        let titleKey: String = "title"
        let promptKey: String = "prompt"
        let viewStore: SecureFieldViewStore = .init(id: "", modifiers: [], titleKey: titleKey, title: "", textKey: textKey, promptKey: promptKey)
        let secureField: InjectedView = .secureField(viewStore: viewStore)
        let container: ViewStoresContainer = .init(viewStores: [secureField])
        

        let value: [InjectedValue] = [
            .string(stateId: stateId, id: textKey, value: ""),
            .string(stateId: stateId, id: titleKey, value: "Title"),
            .string(stateId: stateId, id: promptKey, value: "Prompt")
        ]
        let state: InjectedState = .init(id: stateId, state: value)
        let stateSubject: StateSignal = .init(state)
        
       return ZStack {
           Color(uiColor: .hex("#C0C0C0"))
               .edgesIgnoringSafeArea(.all)
           HStack {
               Spacer().frame(width: 150)
               SecureFieldInsertable(store: SecureFieldStore(store: viewStore, stateSubject: stateSubject), container: container)
           }
        }
    }
}
