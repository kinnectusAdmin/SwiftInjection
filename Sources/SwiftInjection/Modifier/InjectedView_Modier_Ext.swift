//
//  InjectedViewStoreAddModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/13/23.
//

import Foundation

extension InjectedView {
    
    func addModifier(modifier: InjectedModifier) -> InjectedView {
        self |> prop(\.modifiers)({ $0.appending(modifier)})
    }
}


