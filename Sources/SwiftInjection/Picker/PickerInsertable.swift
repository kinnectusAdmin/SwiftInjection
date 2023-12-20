//
//  File.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

struct PickerInsertable: View {
    @ObservedObject var store: PickerStore
    var container: ViewStoresContainer
    var body: some View {
        switch store.composition {
        case .none:
            EmptyView()
        case let .double_title_selection_content(title, pickerList, selection, content):
            
            Picker(title, selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .double(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .double_selection_content_label(pickerList, selection, content, label):
            
            Picker(selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal:  .init(.init(id: "", parameter1: .double(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label).eraseToAnyView()
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .integer_title_selection_content(title, pickerList, selection, content):
            
            Picker(title, selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .integer(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .integer_selection_content_label(pickerList, selection, content, label):
            
            Picker(selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .integer(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label).eraseToAnyView()
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
        
        case let .string_title_selection_content(title, pickerList, selection, content):
            
            Picker(title, selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .string(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .string_selection_content_label(pickerList, selection, content, label):
            
            Picker(selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .string(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label).eraseToAnyView()
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
        
        case let .boolean_title_selection_content(title, pickerList, selection, content):
            
            Picker(title, selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .boolean(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .boolean_selection_content_label(pickerList, selection, content, label):
            
            Picker(selection: selection) {
                ForEach(pickerList, id: \.self) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .boolean(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label).eraseToAnyView()
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
        
        case let .state_title_selection_content(title, pickerList, selection, content):
            
            Picker(title, selection: selection) {
                ForEach(pickerList) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .state(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
            
        case let .state_selection_content_label(pickerList, selection, content, label):
            
            Picker(selection: selection) {
                ForEach(pickerList) { item in
                    Insertable(stateSignal: .init(.init(id: "", parameter1: .state(stateId: "", id: "", value: item))), container: container, viewStore: content).eraseToAnyView()
                }
            } label: {
                Insertable(stateSignal: store.stateSignal, container: container, viewStore: label).eraseToAnyView()
            }.addModifiers(mods: store.viewStore.modifiers, stateSignal: store.stateSignal, container: container)
        }
    }
}
