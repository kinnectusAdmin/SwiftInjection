//
//  SecureFieldInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 9/29/23.
//

import Foundation
import SwiftUI

struct SecureFieldInsertable: View {
    @ObservedObject var store: SecureFieldStore
    var container: ViewStoresContainer
    
    var body: some View {
        SecureField(store.title, text: store.textBinding, prompt: Text(store.prompt))
            .addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
    }
}

struct SecureFieldInsertable_Previews: PreviewProvider {
    static var previews: some View {
        let stateId: String = "state"
        let textKey: String = "text"
        let titleKey: String = "title"
        let promptKey: String = "prompt"
        let secureField: SecureFieldViewStore = .init(id: "", modifiers: [], titleKey: titleKey, title: "", textKey: textKey, promptKey: promptKey)
        let container: ViewStoresContainer = .init(viewStores: [.secureField(viewStore: secureField)])
        

       
        let state: InjectedState = .init(id: stateId,
                                         parameter1: .string(stateId: stateId, id: textKey, value: ""),
                                         parameter2: .string(stateId: stateId, id: titleKey, value: "Title"),
                                         parameter3: .string(stateId: stateId, id: promptKey, value: "Prompt"))
                                         
        let stateSignal: StateSignal = .init(state)
        
       return ZStack {
           Color(uiColor: .hex("#C0C0C0"))
               .edgesIgnoringSafeArea(.all)
           HStack {
               Spacer().frame(width: 150)
               SecureFieldInsertable(store: SecureFieldStore(viewStore: secureField, stateSignal: stateSignal), container: container)
           }
        }
    }
}
