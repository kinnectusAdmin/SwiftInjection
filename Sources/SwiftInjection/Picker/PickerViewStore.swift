//
//  PickerViewStore.swift
//  
//
//  Created by Blake Osonduagwueki on 10/24/23.
//

import Foundation


public struct PickerViewStore: Codable {
    public var id: String
    public var modifiers: [InjectedModifier]
    var pickerListKey: String
    var selectionKey: String
    var composition: PickerComposition
    init(id: String = "", modifiers: [InjectedModifier] = [], pickerListKey: String, selectionKey: String, composition: PickerComposition) {
        self.id = id
        self.modifiers = modifiers
        self.pickerListKey = pickerListKey
        self.selectionKey = selectionKey
        self.composition = composition
    }
}

extension PickerViewStore {
    
    public enum PickerComposition: Codable {
        case title_selection_content(titleKey: String = "", title: String? = nil, pickerListKey: String, selectionKey: String, content: InjectedView)
        case selection_content_label(pickerListKey: String, selectionKey: String, content: InjectedView, label: InjectedView)
    }
}
