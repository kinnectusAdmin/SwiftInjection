//
//  InjectedError.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/24/23.
//

import Foundation

public enum InjectedError: Error {
    case errorWithMessage(message: String)
    case valueNotAvailable
}
