//
//  InjectedPinnedScrollableViews.swift
//  
//
//  Created by Blake Osonduagwueki on 10/8/23.
//

import Foundation
import SwiftUI

public enum InjectedPinnedScrollableViews: String, Codable {
    case none
    case sectionHeaders
    case sectionFooters
    var render: PinnedScrollableViews {
        .init()
    }
}

