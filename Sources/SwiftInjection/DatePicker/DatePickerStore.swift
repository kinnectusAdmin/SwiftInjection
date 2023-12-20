//
//  DatePickerStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation
import SwiftUI

final class DatePickerStore: ObservableObject {
    let viewStore: DatePickerViewStore
    let stateSignal: StateSignal
    @Published var composition: DatePickerComposition = .title_selection_components(title: "", selection: .constant(Date()))
    
    init(viewStore: DatePickerViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        
        func dateBinding(selectionKey: String, state: InjectedState) -> Binding<Date> {
            return Binding<Date>.init {
                findDateValue(stateId: state.id, id: selectionKey, state: state)  ?? Date()
            } set: { date in
                let newState = updateState(state: stateSignal.value, newValue: .date(stateId: state.id, id: selectionKey, value: date))
                stateSignal.send(newState)
            }
        }
        
        stateSignal.map { state -> DatePickerComposition in
            
            switch viewStore.composition {
            case let .title_selection_components(titleKey, title, selectionKey, components):
                
                return .title_selection_components(
                    title: findStringValue(stateId: state.id, id: titleKey, state: state) ?? title ?? "",
                    selection: dateBinding(selectionKey: selectionKey, state: state),
                    components: components)
                
            case let .selection_components_label(selectionKey, components, label):
                return .selection_components_label(
                    selection: dateBinding(selectionKey: selectionKey, state: state),
                    components: components,
                    label: label)
            case let .selection_lowerRange_upperRange_components_label(selectionKey, lowerDate, upperDate, components, label):
                return .selection_lowerRange_upperRange_components_label(
                    selection:  dateBinding(selectionKey: selectionKey, state: state),
                    range: (lowerDate...upperDate),
                    components: components,
                    label: label)
            }
        }.assign(to: &$composition)
    }
}

extension DatePickerStore {
    enum DatePickerComposition {
        case title_selection_components(title: String, selection: Binding<Date>, components: InjectedDatePickerComponents = .date)
        case selection_components_label(selection: Binding<Date>, components: InjectedDatePickerComponents = .date, label: InjectedView)
        case selection_lowerRange_upperRange_components_label(selection: Binding<Date>, range: ClosedRange<Date>, components: InjectedDatePickerComponents = .date, label: InjectedView)
    }
}
