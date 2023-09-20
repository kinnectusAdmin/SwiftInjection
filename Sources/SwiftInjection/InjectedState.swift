import Foundation


public struct InjectedState: Codable, Equatable, Identifiable, Hashable {
    public var id: String
    var state: [InjectedValue]
    public init(id: String, state: [InjectedValue]) {
        self.id = id
        self.state = state.map { value in
            value.updateStateId(stateId: id)
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
