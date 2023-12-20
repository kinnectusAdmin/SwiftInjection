//
//  InjectedAxes.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation
import SwiftUI

public enum InjectedAxes: Codable {
    case horizontal, vertical
    
    var render: Axis.Set {
        switch self {
        case .horizontal:
            return .horizontal
        case.vertical:
            return .vertical
        }
    }
}
