//
//  InjectedGridItem.swift
//  
//
//  Created by Blake Osonduagwueki on 10/8/23.
//

import Foundation
import SwiftUI

public struct InjectedGridItem: Codable {
    var size: Double? = nil
    var spacing: Double? = nil
    var alignment: InjectedAlignment? = nil
    
    var render: GridItem {
        .init()
    }
}
