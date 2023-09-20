//
//  File.swift
//  
//
//  Created by Blake Osonduagwueki on 9/20/23.
//

import Foundation
import SwiftUI

enum InjectedFontWeight {
    case black, bold, heavy, medium, semibold, light, regular, thin, ultraLight
    var render: Font.Weight {
        switch self {
        case .black:
            return .black
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .medium:
            return .medium
        case .semibold:
            return .semibold
        case .light:
            return .light
        case .regular:
            return .thin
        case .thin:
            return .thin
        case .ultraLight:
            return .ultraLight
        }
    }
    
}
