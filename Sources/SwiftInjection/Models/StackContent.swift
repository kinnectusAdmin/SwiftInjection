//
//  StackContent.swift
//  
//
//  Created by Blake Osonduagwueki on 10/22/23.
//

import Foundation

public struct StackContent: Codable {
    var content1: InjectedView
    var content2: InjectedView?
    var content3: InjectedView?
    var content4: InjectedView?
    var content5: InjectedView?
    var content6: InjectedView?
    var content7: InjectedView?
    var content8: InjectedView?
    var content9: InjectedView?
    var content10: InjectedView?
  
    init(_ content1: InjectedView = .empty(), _ content2: InjectedView? = nil, _ content3: InjectedView? = nil, _ content4: InjectedView? = nil, _ content5: InjectedView? = nil, _ content6: InjectedView? = nil, _ content7: InjectedView? = nil, _ content8: InjectedView? = nil, _ content9: InjectedView? = nil, _ content10: InjectedView? = nil) {
        self.content1 = content1
        self.content2 = content2
        self.content3 = content3
        self.content4 = content4
        self.content5 = content5
        self.content6 = content6
        self.content7 = content7
        self.content8 = content8
        self.content9 = content9
        self.content10 = content10
    }
}
