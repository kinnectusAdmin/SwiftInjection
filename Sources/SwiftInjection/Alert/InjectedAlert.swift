//
//  InjectedAlert.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation

public enum InjectedAlert: Codable {
    case primarySecondaryAlert(store: PrimarySecondaryAlertViewStore)
    case dismissAlert(store: DismissAlertViewStore)
}
