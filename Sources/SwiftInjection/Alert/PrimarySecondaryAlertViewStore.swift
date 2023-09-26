//
//  PrimarySecondaryAlertViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//
import Foundation

public struct PrimarySecondaryAlertViewStore: Codable {
    var container: ViewStoresContainer
    var title: TextViewStore
    var message: TextViewStore
    var primary: AlertButton
    var secondary: AlertButton
}
