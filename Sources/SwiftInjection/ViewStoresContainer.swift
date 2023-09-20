//
//  ViewStoresContainer.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/26/23.
//

import Foundation

public struct ViewStoresContainer: Codable {
    let viewStores: [InjectedView]
    public var entry: InjectedView? {
        viewStores.first(where: {$0.id == "entry"})
    }
    public init(viewStores: [InjectedView]) {
        self.viewStores = viewStores
    }
}
