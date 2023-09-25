//
//  StateFunctions.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/1/23.
//

import Foundation

func findBooleanValue(stateId: String, id: String, state: InjectedState) -> Bool? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.boolean
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findBooleanValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStringValue(stateId: String, id: String, state: InjectedState) -> String? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.string
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStringValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findIntegerValue(stateId: String, id: String, state: InjectedState) -> Int? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.integer
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findIntegerValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDoubleValue(stateId: String, id: String, state: InjectedState) -> Double? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.double
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDoubleValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDataValue(stateId: String, id: String, state: InjectedState) -> Data? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.data
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDataValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findBooleanArrayValue(stateId: String, id: String, state: InjectedState) -> [Bool]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.booleanArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findBooleanArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStringArrayValue(stateId: String, id: String, state: InjectedState) -> [String]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.stringArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStringArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findIntegerArrayValue(stateId: String, id: String, state: InjectedState) -> [Int]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.integerArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findIntegerArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDoubleArrayValue(stateId: String, id: String, state: InjectedState) -> [Double]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.doubleArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDoubleArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDataArrayValue(stateId: String, id: String, state: InjectedState) -> [Data]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.dataArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDataArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStateArrayValue(stateId: String, id: String, state: InjectedState) -> [InjectedState]? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.stateArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStateArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
    
}

func findStateValue(stateId: String, id: String, state: InjectedState) -> InjectedState? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})?.state
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStateValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findInjectedValue(stateId: String, id: String, state: InjectedState) -> InjectedValue? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id})
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findInjectedValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}
func findValue<Value>(type: Value.Type, stateId: String, id: String, state: InjectedState) -> Value? {
    if state.id == stateId || stateId == .empty {
        return state.state.first(where: {$0.id == id}) as? Value
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findValue(type: type, stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}
func updateState(state: InjectedState, newValue: InjectedValue) -> InjectedState {
    state |> prop(\.state)({
        $0.map { value in
            if value.id == newValue.id {
                return newValue
            } else {
                return value
            }
        }
    })
}
