//
//  IfViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

public struct IfViewStore: Codable {
    var id: String = ""
    var conditionKey: String = ""
    var content: InjectedView 
}
