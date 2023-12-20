//
//  StandardTableInsertable.swift
//  
//
//  Created by Blake Osonduagwueki on 10/9/23.
//

import Foundation
import SwiftUI

struct StandardTableInsertable: View {
    @ObservedObject var store: StandardTableStore
    var container: ViewStoresContainer
    var standardTable: some View {
        Table(store.tableStateValues) {
            TableColumn(store.viewStore.standardTable?.viewStore1?.title ?? "", value: \InjectedState.parameter1.absoluteString)
            TableColumn(store.viewStore.standardTable?.viewStore2?.title ?? "", value: \InjectedState.parameter2.absoluteString)
//            TableColumn(store.viewStore.standardTable?.viewStore3?.title ?? "", value: \InjectedState.parameter3.absoluteString)
//            TableColumn(store.viewStore.standardTable?.viewStore4?.title ?? "", value: \InjectedState.parameter4.absoluteString)
//            TableColumn(store.viewStore.standardTable?.viewStore5?.title ?? "", value: \InjectedState.parameter5.absoluteString)
        }
    }
    var body: some View {
       EmptyView()
    }
}
