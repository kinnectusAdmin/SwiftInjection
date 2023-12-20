//
//  AlertButton.swift
//  
//
//  Created by Blake Osonduagwueki on 9/26/23.
//

import Foundation

public enum AlertButton: Codable {
    case cancel(label: TextViewStore, action: InjectedOperation?)
    case `default`(label: TextViewStore, action: InjectedOperation?)
    case destructive(label: TextViewStore, action: InjectedOperation?)
}
