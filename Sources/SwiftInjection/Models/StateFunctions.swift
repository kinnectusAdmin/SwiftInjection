//
//  StateFunctions.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/1/23.
//

import Foundation

func findBooleanValue(stateId: String, id: String, state: InjectedState) -> Bool? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.boolean
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findBooleanValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStringValue(stateId: String, id: String, state: InjectedState) -> String? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.string
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStringValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findIntegerValue(stateId: String, id: String, state: InjectedState) -> Int? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.integer
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findIntegerValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDoubleValue(stateId: String, id: String, state: InjectedState) -> Double? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.double
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDoubleValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDataValue(stateId: String, id: String, state: InjectedState) -> Data? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.data
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDataValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDateValue(stateId: String, id: String, state: InjectedState) -> Date? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.date
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDateValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findBooleanArrayValue(stateId: String, id: String, state: InjectedState) -> [Bool]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.booleanArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findBooleanArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStringArrayValue(stateId: String, id: String, state: InjectedState) -> [String]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.stringArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStringArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findIntegerArrayValue(stateId: String, id: String, state: InjectedState) -> [Int]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.integerArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findIntegerArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDoubleArrayValue(stateId: String, id: String, state: InjectedState) -> [Double]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.doubleArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDoubleArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDataArrayValue(stateId: String, id: String, state: InjectedState) -> [Data]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.dataArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDataArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findDateArrayValue(stateId: String, id: String, state: InjectedState) -> [Date]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.dateArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findDateArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStateArrayValue(stateId: String, id: String, state: InjectedState) -> [InjectedState]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.stateArray
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStateArrayValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
    
}

func findStateValue(stateId: String, id: String, state: InjectedState) -> InjectedState? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.state
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStateValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findStateCollection(stateId: String, id: String, state: InjectedState) -> [String: InjectedState]? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)?.stateCollection
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findStateCollection(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findInjectedValue(stateId: String, id: String, state: InjectedState) -> InjectedValue? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id)
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findInjectedValue(stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func findValue<Value>(type: Value.Type, stateId: String, id: String, state: InjectedState) -> Value? {
    if state.id == stateId || stateId == .empty {
        return state.map(key: id) as? Value
    } else if let state = findStateValue(stateId: state.id, id: stateId, state: state) {
        return findValue(type: type, stateId: state.id, id: id, state: state)
    } else {
        return nil
    }
}

func updateState(state: InjectedState, newValue: InjectedValue) -> InjectedState {
    guard let _ = findInjectedValue(stateId: state.id, id: newValue.id, state: state) else {
        guard let firstEmptyValueId = state.allParameters().first(where: {$0 == .none })?.id else {
            return state
        }
        return state |> prop(state.keyValue(for: firstEmptyValueId))({ _ in
            newValue
        })
    }
    return state |> prop(state.keyValue(for: newValue.id))({ _ in
        newValue
    })
}

func findHashableArray(stateId: String, id: String, state: InjectedState) -> [any Equatable] {
    if let list = findDoubleArrayValue(stateId: stateId, id: id, state: state) {
        return list
    } else if let list = findStringArrayValue(stateId: stateId, id: id, state: state) {
        return list
    } else if let list = findIntegerArrayValue(stateId: stateId, id: id, state: state) {
        return list
    } else if let list = findBooleanArrayValue(stateId: stateId, id: id, state: state) {
        return list
    } else if let list = findStateArrayValue(stateId: stateId, id: id, state: state) {
        return list
    } else {
        return []
    }
}
