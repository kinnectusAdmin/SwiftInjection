//
//  ButtonViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


public struct ButtonViewStore: Codable {
    public var id: String = ""
    public var modifiers: [InjectedModifier] = []
    var operation1: InjectedOperation? = nil
    var operation2: InjectedOperation? = nil
    var operation3: InjectedOperation? = nil
    var operation4: InjectedOperation? = nil
    var operation5: InjectedOperation? = nil
    var operation6: InjectedOperation? = nil
    var operation7: InjectedOperation? = nil
    var operation8: InjectedOperation? = nil
    var operation9: InjectedOperation? = nil
    var operation10: InjectedOperation? = nil
    var content: InjectedView
    
    public init(id: String = "", modifiers: [InjectedModifier] = [], operation1: InjectedOperation? = nil, operation2: InjectedOperation? = nil, operation3: InjectedOperation? = nil, operation4: InjectedOperation? = nil, operation5: InjectedOperation? = nil, operation6: InjectedOperation? = nil, operation7: InjectedOperation? = nil, operation8: InjectedOperation? = nil, operation9: InjectedOperation? = nil, operation10: InjectedOperation? = nil, content: InjectedView) {
        self.id = id
        self.modifiers = modifiers
        self.operation1 = operation1
        self.operation2 = operation2
        self.operation3 = operation3
        self.operation4 = operation4
        self.operation5 = operation5
        self.operation6 = operation6
        self.operation7 = operation7
        self.operation8 = operation8
        self.operation9 = operation9
        self.operation10 = operation10
        self.content = content
    }
    
    
}
