//
//  PickerStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/24/23.
//

import Foundation
import SwiftUI

final class PickerStore: ObservableObject {
    let viewStore: PickerViewStore
    let stateSignal: StateSignal
    @Published var composition: PickerComposition
    
    init(viewStore: PickerViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.composition = .none
        
        func providePickerList(state: InjectedState, pickerListKey: String) -> [any Hashable] {
            if let list = findDoubleArrayValue(stateId: state.id, id: pickerListKey, state: state) {
                return list
            } else if let list = findStringArrayValue(stateId: state.id, id: pickerListKey, state: state) {
                return list
            } else if let list = findIntegerArrayValue(stateId: state.id, id: pickerListKey, state: state) {
                return list
            } else if let list = findBooleanArrayValue(stateId: state.id, id: pickerListKey, state: state) {
                return list
            } else if let list = findStateArrayValue(stateId: state.id, id: pickerListKey, state: state) {
                return list
            } else {
                return []
            }
        }

        func updateStateForSelection<T: Hashable>(_ selectedItem: T) {
            let state = stateSignal.value
            var value: InjectedValue {
                if let double = selectedItem as? Double {
                    return InjectedValue.double(stateId: state.id, id: viewStore.selectionKey, value: double)
                } else if let integer = selectedItem as? Int {
                    return InjectedValue.integer(stateId: state.id, id: viewStore.selectionKey, value: integer)
                } else if let string = selectedItem as? String {
                    return InjectedValue.string(stateId: state.id, id: viewStore.selectionKey, value: string)
                } else if let boolean = selectedItem as? Bool {
                    return InjectedValue.boolean(stateId: state.id, id: viewStore.selectionKey, value: boolean)
                } else if let state = selectedItem as? InjectedState {
                    return InjectedValue.state(stateId: state.id, id: viewStore.selectionKey, value: state)
                } else {
                    return .none
                }
            }
            let updateState = updateState(state: state, newValue: value)
            self.stateSignal.send(updateState)
        }
        
        func selectedDoubleItemBinding(_ state: InjectedState) -> Binding<Double> {
            let item = findDoubleValue(stateId: state.id, id: viewStore.selectionKey, state: state) ?? .zero
            return .init(get: { item }, set: updateStateForSelection)
        }
        
        func selectedStringItemBinding(_ state: InjectedState) -> Binding<String> {
            let item = findStringValue(stateId: state.id, id: viewStore.selectionKey, state: state) ?? .empty
            return .init(get: { item }, set: updateStateForSelection)
        }
        
        func selectedIntegerItemBinding(_ state: InjectedState) -> Binding<Int> {
            let item = findIntegerValue(stateId: state.id, id: viewStore.selectionKey, state: state) ?? .zero
            return .init(get: { item }, set: updateStateForSelection)
        }
        
        func selectedBooleanItemBinding(_ state: InjectedState) -> Binding<Bool> {
            let item = findBooleanValue(stateId: state.id, id: viewStore.selectionKey, state: state) ?? false
            return .init(get: { item }, set: updateStateForSelection)
        }
        
        func selectedStateItemBinding(_ state: InjectedState) -> Binding<InjectedState> {
            let item = findStateValue(stateId: state.id, id: viewStore.selectionKey, state: state) ?? .empty
            return .init(get: { item }, set: updateStateForSelection)
        }
        
        stateSignal.map { state -> PickerComposition in
            let list = providePickerList(state: state, pickerListKey: viewStore.pickerListKey)
            let pickerValueType = PickerValueType.typeForValue(state.map(key: viewStore.selectionKey) ?? .none)
            switch viewStore.composition {
            case let .title_selection_content(titleKey, title, _, _, content):
                let title = findStringValue(stateId: state.id, id: titleKey, state: state) ?? title ?? ""
                switch pickerValueType {
                case .string:
                    return .string_title_selection_content(title: title, pickerList: list as? [String] ?? [], selection: selectedStringItemBinding(state), content: content)

                case .double:
                    return .double_title_selection_content(title: title, pickerList: list as? [Double] ?? [], selection: selectedDoubleItemBinding(state), content: content)

                case .integer:
                    return .integer_title_selection_content(title: title, pickerList: list as? [Int] ?? [], selection: selectedIntegerItemBinding(state), content: content)

                case .boolean:
                    return .boolean_title_selection_content(title: title, pickerList: list as? [Bool] ?? [], selection: selectedBooleanItemBinding(state), content: content)

                case .state:
                    return .state_title_selection_content(title: title, pickerList: list as? [InjectedState] ?? [], selection: selectedStateItemBinding(state), content: content)

                default:
                    return .string_title_selection_content(title: title, pickerList: [""], selection: .constant(""), content: content)
                }
                
            case let .selection_content_label(_, _, content, label):
                switch pickerValueType {
                case .string:
                    return .string_selection_content_label(pickerList: list as? [String] ?? [], selection: selectedStringItemBinding(state), content: content, label: label)

                case .double:
                    return .double_selection_content_label(pickerList: list as? [Double] ?? [], selection: selectedDoubleItemBinding(state), content: content, label: label)

                case .integer:
                    return .integer_selection_content_label(pickerList: list as? [Int] ?? [], selection: selectedIntegerItemBinding(state), content: content, label: label)

                case .boolean:
                    return .boolean_selection_content_label(pickerList: list as? [Bool] ?? [], selection: selectedBooleanItemBinding(state), content: content, label: label)

                case .state:
                    return .state_selection_content_label(pickerList: list as? [InjectedState] ?? [], selection: selectedStateItemBinding(state), content: content, label: label)
                default:
                    return .string_selection_content_label(pickerList: [""], selection: .constant(""), content: content, label: label)

                }
            }
        }.assign(to: &$composition)
        
    }
    
}


extension PickerStore {
    
    enum PickerValueType {
        case string, double, integer, boolean, state, unknown
        static func typeForValue(_ value: InjectedValue) -> PickerValueType {
            if let _ = value.double {
                return .double
            } else if let _ = value.integer {
                return .integer
            } else if let _ = value.string {
                return .string
            } else if let _ = value.boolean {
                return .boolean
            } else if let _ = value.state {
                return .state
            } else {
                return .unknown
            }
        }
    }
    
    enum PickerComposition {
        case none
        
        case double_title_selection_content(title: String, pickerList: [Double], selection: Binding<Double>, content: InjectedView)
        case double_selection_content_label(pickerList: [Double], selection: Binding<Double>, content: InjectedView, label: InjectedView)
        
        case integer_title_selection_content(title: String, pickerList: [Int], selection: Binding<Int>, content: InjectedView)
        case integer_selection_content_label(pickerList: [Int], selection: Binding<Int>, content: InjectedView, label: InjectedView)
        
        case string_title_selection_content(title: String, pickerList: [String], selection: Binding<String>, content: InjectedView)
        case string_selection_content_label(pickerList: [String], selection: Binding<String>, content: InjectedView, label: InjectedView)
        
        case boolean_title_selection_content(title: String, pickerList: [Bool], selection: Binding<Bool>, content: InjectedView)
        case boolean_selection_content_label(pickerList: [Bool], selection: Binding<Bool>, content: InjectedView, label: InjectedView)
        
        case state_title_selection_content(title: String, pickerList: [InjectedState], selection: Binding<InjectedState>, content: InjectedView)
        case state_selection_content_label(pickerList: [InjectedState], selection: Binding<InjectedState>, content: InjectedView, label: InjectedView)
    }
}

