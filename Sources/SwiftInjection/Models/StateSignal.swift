//
//  StateSignal.swift
//  
//
//  Created by Blake Osonduagwueki on 9/27/23.
//

import Foundation
import Combine

public typealias StateSignal = CurrentValueSubject<InjectedState, Never>

extension StateSignal {
    
    func appending(value: InjectedValue) -> StateSignal {
        let updateValue = updateState(state: self.value, newValue: value)
        self.value = updateValue
        return self
    }
    
    func appending(values: InjectedValue...) -> StateSignal {
        values.reduce(self) { partialResult, value in
            partialResult.appending(value: value)
        }
    }
}
