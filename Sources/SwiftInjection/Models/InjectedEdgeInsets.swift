//
//  InjectedEdgeInsets.swift
//  
//
//  Created by Blake Osonduagwueki on 9/25/23.
//

import Foundation
import SwiftUI
public struct InjectedEdgeInSets: Codable {
    var top: Double = 0, leading: Double = 0, bottom: Double = 0, trailing: Double = 0
    var render: EdgeInsets {
        .init(top: CGFloat(top), leading: CGFloat(leading), bottom: CGFloat(bottom), trailing: CGFloat(trailing))
    }
}
