//
//  DismissAlertViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation

public struct DismissAlertViewStore: Codable {
    var title: TextViewStore
    var message: TextViewStore
    var button: AlertButton
}
