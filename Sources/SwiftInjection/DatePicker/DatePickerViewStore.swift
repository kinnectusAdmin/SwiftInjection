//
//  DatePickerViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/25/23.
//

import Foundation

public struct DatePickerViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var composition: DatePickerComposition
    init(id: String = "", modifiers: [InjectedModifier] = [], composition: DatePickerComposition) {
        self.id = id
        self.modifiers = modifiers
        self.composition = composition
    }
}


extension DatePickerViewStore {
    public enum DatePickerComposition: Codable {
        case title_selection_components(titleKey: String = "", title: String? = nil, selectionKey: String, components: InjectedDatePickerComponents = .date)
        case selection_components_label(selectionKey: String, components: InjectedDatePickerComponents = .date, label: InjectedView)
        case selection_lowerRange_upperRange_components_label(selectionKey: String, lowerDate: Date, upperDate: Date, components: InjectedDatePickerComponents = .date, label: InjectedView)
    }
}
