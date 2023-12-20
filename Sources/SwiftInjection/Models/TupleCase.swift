//
//  TupleCase.swift
//  
//
//  Created by Blake Osonduagwueki on 10/15/23.
//

import Foundation

enum TupleCase<T> {
    case none
    case one(T)
    case two(T, T)
    case three(T, T, T)
    case four(T, T, T, T)
    case five(T, T, T, T, T)
    case six(T, T, T, T, T, T)
    case seven(T, T, T, T, T, T, T)
    case eight(T, T, T, T, T, T, T, T)
    case nine(T, T, T, T, T, T, T, T, T)
    case ten(T, T, T, T, T, T, T, T, T, T)
    
    init(_ value1: T, _ value2: T?, _ value3: T?, _ value4: T?, _ value5: T?, _ value6: T?, _ value7: T?, _ value8: T?, _ value9: T?, _ value10: T?) {
        switch (value1, value2, value3, value4, value5, value6, value7, value8, value9, value10) {
        case (let value, .none, .none, .none, .none, .none, .none, .none, .none, .none):
            self = .one(value)
        case (let value1, .some(let value2), .none, .none, .none, .none, .none, .none, .none, .none):
            self = .two(value1, value2)
        case (let value1, .some(let value2), .some(let value3), .none, .none, .none, .none, .none, .none, .none):
            self = .three(value1, value2, value3)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .none, .none, .none, .none, .none, .none):
            self = .four(value1, value2, value3, value4)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .none, .none, .none, .none, .none):
            self = .five(value1, value2, value3, value4, value5)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .some(let value6), .none, .none, .none, .none):
            self = .six(value1, value2, value3, value4, value5, value6)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .some(let value6), .some(let value7), .none, .none, .none):
            self = .seven(value1, value2, value3, value4, value5, value6, value7)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .some(let value6), .some(let value7), .some(let value8), .none, .none):
            self = .eight(value1, value2, value3, value4, value5, value6, value7, value8)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .some(let value6), .some(let value7), .some(let value8), .some(let value9), .none):
            self = .nine(value1, value2, value3, value4, value5, value6, value7, value8, value9)
        case (let value1, .some(let value2), .some(let value3), .some(let value4), .some(let value5), .some(let value6), .some(let value7), .some(let value8), .some(let value9), .some(let value10)):
            self = .ten(value1, value2, value3, value4, value5, value6, value7, value8, value9, value10)
        default:
            self = .none
        }
    }
}
