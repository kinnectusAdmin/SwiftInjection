//
//  ProgressViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation

public struct ProgressViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var composition: ProgressViewComposition
    init(id: String = "", modifiers: [InjectedModifier] = [], composition: ProgressViewComposition) {
        self.id = id
        self.modifiers = modifiers
        self.composition = composition
    }
}

extension ProgressViewStore {
    enum ProgressViewComposition: Codable {
        case standard
        case title(titleKey: String = "", title: String = "")
        case title_value(titleKey: String = "", valueKey: String = "", totalKey: String = "", title: String = "")
        case label(InjectedView)
        case timerInterval(lowerDate: Date, upperDate: Date)
        case timerInterval_label(lowerDate: Date, upperDate: Date, label: InjectedView)
        case timerInterval_countsdown_label_currentValueLabel(lowerDate: Date,
                                                              upperDate: Date,
                                                              countsdown: Bool,
                                                              label: InjectedView,
                                                              currentValueLabel: InjectedView)
        case value_total(valueKey: String, totalKey: String)
        case value_total_label(valueKey: String, totalKey: String, label: InjectedView)
        case value_total_label_currentValueLabel(valueKey: String, totalKey: String, label: InjectedView, currentValueLabel: InjectedView)
    }
}
