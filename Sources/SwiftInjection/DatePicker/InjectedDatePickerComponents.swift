//
//  InjectedDatePickerComponents.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation
import SwiftUI

public enum InjectedDatePickerComponents: Codable {
    case hourAndMinute
    case date
    
    var render: DatePickerComponents {
        switch self {
        case .hourAndMinute:
            return .hourAndMinute
        case .date:
            return .date
        }
    }
}
