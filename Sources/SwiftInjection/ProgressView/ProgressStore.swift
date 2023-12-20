//
//  ProgressStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

final class ProgressStore: ObservableObject {
    let viewStore: ProgressViewStore
    let stateSignal: StateSignal
    @Published var state: InjectedState
    @Published var composition: ProgressViewComposition = .standard
    
    init(viewStore: ProgressViewStore, stateSignal: StateSignal) {
        self.viewStore = viewStore
        self.stateSignal = stateSignal
        self.state = stateSignal.value
        
        stateSignal.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state -> ProgressViewComposition in
            switch viewStore.composition {
            case .standard:
                return .standard
            case .label(let label):
                return .label(label)
            case .timerInterval(let lowerDate, let upperDate):
                return .timerInterval(lowerDate: lowerDate, upperDate: upperDate)
            case let .timerInterval_label(lowerDate, upperDate, label):
                return .timerInterval_label(lowerDate: lowerDate, upperDate: upperDate, label: label)
            case .title(let titleKey, let title):
                let title = findStringValue(stateId: state.id, id: titleKey, state: state) ?? title
                return .title(title: title)
            case let .title_value(titleKey, valueKey, totalKey, title):
                let title = findStringValue(stateId: state.id, id: titleKey, state: state) ?? title
                if let value = findDoubleValue(stateId: state.id, id: valueKey, state: state), let total = findDoubleValue(stateId: state.id, id: totalKey, state: state) {
                    return .title_value(title: title, value: value, total: total)
                } else {
                    return .title(title: title)
                }
            case let .timerInterval_countsdown_label_currentValueLabel(lowerDate, upperDate, countsdown, label, currentValueLabel):
                return .timerInterval_countsdown_label_currentValueLabel(lowerDate: lowerDate, upperDate: upperDate, countsdown: countsdown, label: label, currentValueLabel: currentValueLabel)
            case let .value_total(valueKey, totalKey):
                if let value = findDoubleValue(stateId: state.id, id: valueKey, state: state), let total = findDoubleValue(stateId: state.id, id: totalKey, state: state) {
                    return .value_total(value: value, total: total)
                } else {
                    return .standard
                }
            case let .value_total_label(valueKey, totalKey, label):
                if let value = findDoubleValue(stateId: state.id, id: valueKey, state: state), let total = findDoubleValue(stateId: state.id, id: totalKey, state: state) {
                    return .value_total_label(value: value, total: total, label: label)
                } else {
                    return .standard
                }
            case let .value_total_label_currentValueLabel(valueKey, totalKey, label, currentValueLabel):
                if let value = findDoubleValue(stateId: state.id, id: valueKey, state: state), let total = findDoubleValue(stateId: state.id, id: totalKey, state: state) {
                    return .value_total_label_currentValueLabel(value: value, total: total, label: label, currentValueLabel: currentValueLabel)
                } else {
                    return .standard
                }
            }
        }.assign(to: &$composition)
    }
}
extension ProgressStore {
    enum ProgressViewComposition {
        case standard
        case title(title: String)
        case title_value(title: String, value: Double, total: Double)
        case label(InjectedView)
        case timerInterval(lowerDate: Date, upperDate: Date)
        case timerInterval_label(lowerDate: Date, upperDate: Date, label: InjectedView)
        case timerInterval_countsdown_label_currentValueLabel(lowerDate: Date,
                                                              upperDate: Date,
                                                              countsdown: Bool,
                                                              label: InjectedView,
                                                              currentValueLabel: InjectedView)
        case value_total(value: Double, total: Double)
        case value_total_label(value: Double, total: Double, label: InjectedView)
        case value_total_label_currentValueLabel(value: Double, total: Double, label: InjectedView, currentValueLabel: InjectedView)
    }
    
}
