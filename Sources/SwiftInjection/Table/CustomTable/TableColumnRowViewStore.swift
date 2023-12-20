//
//  TableColumnRowViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/19/23.
//

import Foundation

public struct TableColumnRowViewStore: Codable {
    var title: String
    var columnKey: String
    var tableStateKey: String
    var view: InjectedView
    var state: InjectedState
}
