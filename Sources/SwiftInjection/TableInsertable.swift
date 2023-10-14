//
//  TableInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

public struct TableViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var tableStateKey: String
    var tableType: TableType
    
    enum TableType: Codable {
        case standard
        case custom
    }
}

final class TableStore: ObservableObject {
    let viewStore: TableViewStore
    let stateSubject: StateSignal
    @Published var state: InjectedState
    @Published var tableStateValues: [TableValue] = []
    @Published var tableColumns_Standard: TableColumnComposition
    @Published var tableColumns_Custom: TableColumnRowComposition
    init(viewStore: TableViewStore, stateSubject: StateSignal) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state in
            let tableStates: [String: InjectedState] = findStateCollection(stateId: state.id, id: viewStore.tableStateKey, state: state) ?? [:]
            let tupleTableStates = tableStates.map {
                (title: $0.key, state: $0.value)
            }.map { title, state in
                (title: title, stateValues: state.map { $0.string ?? ""}.toTenLengthTuple())
            }.map { title, stateValues in
                return TableValue(id: UUID().uuidString,
                                  title: title,
                                  parameterA: tableStateTuple.0,
                                  parameterB: tableStateTuple.1,
                                  parameterC: tableStateTuple.2,
                                  parameterD: tableStateTuple.3,
                                  parameterE: tableStateTuple.4,
                                  parameterF: tableStateTuple.5,
                                  parameterG: tableStateTuple.6,
                                  parameterH: tableStateTuple.7,
                                  parameterI: tableStateTuple.8,
                                  parameterJ: tableStateTuple.9)
            }
            return tupleTableStates
        }.assign(to: &$tableStateValues)
        
        $tableStateValues.map { tableStates -> [TableColumnViewStore] in
            tableStates.map { tableState in
                TableColumnViewStore(title: tableState.title, keyValueKey: tableState.keyValueKey, table: tableState)
            }
        }.assign(to: &$tableColumns_Standard)
    }
}

public enum TableColumnComposition {
    case oneColumn(TableColumnViewStore)
    case towColumns(TableColumnViewStore, TableColumnViewStore)
    case threeColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case fourColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case fiveColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case sixColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case sevenColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case eightColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case nineColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
    case tenColumns(TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore, TableColumnViewStore)
}

public struct TableColumnViewStore: Codable {
    var title: String
    var keyValueKey: String
    var table: TableValue
    func keyValue() -> KeyPath<TableValue, String> {
        switch keyValueKey {
        case table.parameterA:
            return \.parameterA
        case table.parameterB:
            return \.parameterB
        case table.parameterC:
            return \.parameterC
        case table.parameterD:
            return \.parameterD
        case table.parameterE:
            return \.parameterE
        case table.parameterF:
            return \.parameterF
        case table.parameterG:
            return \.parameterG
        case table.parameterH:
            return \.parameterH
        case table.parameterI:
            return \.parameterI
        case table.parameterJ:
            return \.parameterJ
        default:
            return \.parameterA
        }
    }
}
struct TableInsertable: View {
    @ObservedObject var store: TableStore
    var container: ViewStoresContainer
    var body: some View {
        switch store.viewStore.tableType {
        case .standard:
            Table(store.tableStateValues) {
                columns
            }
        case .custom:
            Table {
                
            } rows: {
                rows
            }
        }
        
    }
    
    @ViewBuilder var rows: TableRow {
        switch store.tableColumns_Custom {
        case .oneRow(let viewStore):
            TableRow(viewStore.state)
        case .twoRows(viewStore, viewStore):
            
        case .threeRows(viewStore, viewStore, viewStore):
            
        case .fourRows(viewStore, viewStore, viewStore, viewStore):
            
        case .fiveRows(viewStore, viewStore, viewStore, viewStore, viewStore):
            
        case .sixRows(viewStore, viewStore, viewStore, viewStore, viewStore, viewStore):
            
        case .sevenRows(viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore):
            
        case .eightRows(viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore):
            
        case .nineRows(viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore):
            
        case .tenRows(viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore, viewStore):
            
        }
    }
    @ViewBuilder var columns: TableColumn<TableValue, Never, Text, Text> {
        switch store.tableColumns_Standard {
        case let .oneColumn(column):
            TableColumn(column.title, value: column.keyValue())
        case let .towColumns(column1, column2):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
        case let .threeColumns(column1, column2, column3):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
        case let .fourColumns(column1, column2, column3, column4):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
        case let .fiveColumns(column1, column2, column3, column4, column5):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
        case let .sixColumns(column1, column2, column3, column4, column5, column6):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
            TableColumn(column6.title, value: column6.keyValue())
        case let .sevenColumns(column1, column2, column3, column4, column5, column6, column7):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
            TableColumn(column6.title, value: column6.keyValue())
            TableColumn(column7.title, value: column7.keyValue())
        case let .eightColumns(column1, column2, column3, column4, column5, column6, column7, column8):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
            TableColumn(column6.title, value: column6.keyValue())
            TableColumn(column7.title, value: column7.keyValue())
            TableColumn(column8.title, value: column8.keyValue())
        case let .nineColumns(column1, column2, column3, column4, column5, column6, column7, column8, column9):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
            TableColumn(column6.title, value: column6.keyValue())
            TableColumn(column7.title, value: column7.keyValue())
            TableColumn(column8.title, value: column8.keyValue())
            TableColumn(column9.title, value: column9.keyValue())
        case let .tenColumns(column1, column2, column3, column4, column5, column6, column7, column8, column9, column10):
            TableColumn(column1.title, value: column1.keyValue())
            TableColumn(column2.title, value: column2.keyValue())
            TableColumn(column3.title, value: column3.keyValue())
            TableColumn(column4.title, value: column4.keyValue())
            TableColumn(column5.title, value: column5.keyValue())
            TableColumn(column6.title, value: column6.keyValue())
            TableColumn(column7.title, value: column7.keyValue())
            TableColumn(column8.title, value: column8.keyValue())
            TableColumn(column9.title, value: column9.keyValue())
            TableColumn(column10.title, value: column10.keyValue())
        }
    }
}

public struct TableValue: Identifiable, Codable {
    public var id: String
    var title: String
    var parameterA: String
    var parameterB: String
    var parameterC: String
    var parameterD: String
    var parameterE: String
    var parameterF: String
    var parameterG: String
    var parameterH: String
    var parameterI: String
    var parameterJ: String
}

public struct TableColumnRowViewStore: Codable {
    var title: String
    var columnKey: String
    var view: InjectedView
    var state: TableValue
}

public enum TableColumnRowComposition {
    case oneRow(TableColumnRowViewStore)
    case twoRows(TableColumnRowViewStore, TableColumnRowViewStore)
    case threeRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case fourRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case fiveRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case sixRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case sevenRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case eightRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case nineRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
    case tenRows(TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore, TableColumnRowViewStore)
}
