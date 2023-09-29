//
//  DismissAlertViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation

public struct DismissAlertViewStore: Codable, Identifiable {
    public var id: String = ""
    var title: TextViewStore
    var message: TextViewStore
    var button: AlertButton
}
