import Foundation

public struct InjectedState: Codable, Equatable, Identifiable, Hashable {
    public var id: String
    public var parameter1: InjectedValue
    public var parameter2: InjectedValue
    public var parameter3: InjectedValue
    public var parameter4: InjectedValue
    public var parameter5: InjectedValue
    public var parameter6: InjectedValue
    public var parameter7: InjectedValue
    public var parameter8: InjectedValue
    public var parameter9: InjectedValue
    public var parameter10: InjectedValue
    public var parameter11: InjectedValue
    public var parameter12: InjectedValue
    public var parameter13: InjectedValue
    public var parameter14: InjectedValue
    public var parameter15: InjectedValue
    public var parameter16: InjectedValue
    public var parameter17: InjectedValue
    public var parameter18: InjectedValue
    public var parameter19: InjectedValue
    public var parameter20: InjectedValue
    public var parameter21: InjectedValue
    public var parameter22: InjectedValue
    public var parameter23: InjectedValue
    public var parameter24: InjectedValue
    public var parameter25: InjectedValue
    public var parameter26: InjectedValue
    public var parameter27: InjectedValue
    public var parameter28: InjectedValue
    public var parameter29: InjectedValue
    public var parameter30: InjectedValue
    public var parameter31: InjectedValue
    public var parameter32: InjectedValue
    public var parameter33: InjectedValue
    public var parameter34: InjectedValue
    public var parameter35: InjectedValue
    public var parameter36: InjectedValue
    public var parameter37: InjectedValue
    public var parameter38: InjectedValue
    public var parameter39: InjectedValue
    public var parameter40: InjectedValue
    public var parameter41: InjectedValue
    public var parameter42: InjectedValue
    public var parameter43: InjectedValue
    public var parameter44: InjectedValue
    public var parameter45: InjectedValue
    public var parameter46: InjectedValue
    public var parameter47: InjectedValue
    public var parameter48: InjectedValue
    public var parameter49: InjectedValue
    public var parameter50: InjectedValue
    
    public init(id: String,
                parameter1: InjectedValue = .none,
                parameter2: InjectedValue = .none,
                parameter3: InjectedValue = .none,
                parameter4: InjectedValue = .none,
                parameter5: InjectedValue = .none,
                parameter6: InjectedValue = .none,
                parameter7: InjectedValue = .none,
                parameter8: InjectedValue = .none,
                parameter9: InjectedValue = .none,
                parameter10: InjectedValue = .none,
                parameter11: InjectedValue = .none,
                parameter12: InjectedValue = .none,
                parameter13: InjectedValue = .none,
                parameter14: InjectedValue = .none,
                parameter15: InjectedValue = .none,
                parameter16: InjectedValue = .none,
                parameter17: InjectedValue = .none,
                parameter18: InjectedValue = .none,
                parameter19: InjectedValue = .none,
                parameter20: InjectedValue = .none,
                parameter21: InjectedValue = .none,
                parameter22: InjectedValue = .none,
                parameter23: InjectedValue = .none,
                parameter24: InjectedValue = .none,
                parameter25: InjectedValue = .none,
                parameter26: InjectedValue = .none,
                parameter27: InjectedValue = .none,
                parameter28: InjectedValue = .none,
                parameter29: InjectedValue = .none,
                parameter30: InjectedValue = .none,
                parameter31: InjectedValue = .none,
                parameter32: InjectedValue = .none,
                parameter33: InjectedValue = .none,
                parameter34: InjectedValue = .none,
                parameter35: InjectedValue = .none,
                parameter36: InjectedValue = .none,
                parameter37: InjectedValue = .none,
                parameter38: InjectedValue = .none,
                parameter39: InjectedValue = .none,
                parameter40: InjectedValue = .none,
                parameter41: InjectedValue = .none,
                parameter42: InjectedValue = .none,
                parameter43: InjectedValue = .none,
                parameter44: InjectedValue = .none,
                parameter45: InjectedValue = .none,
                parameter46: InjectedValue = .none,
                parameter47: InjectedValue = .none,
                parameter48: InjectedValue = .none,
                parameter49: InjectedValue = .none,
                parameter50: InjectedValue = .none) {
        self.id = id
        self.parameter1 = parameter1
        self.parameter2 = parameter2
        self.parameter3 = parameter3
        self.parameter4 = parameter4
        self.parameter5 = parameter5
        self.parameter6 = parameter6
        self.parameter7 = parameter7
        self.parameter8 = parameter8
        self.parameter9 = parameter9
        self.parameter10 = parameter10
        self.parameter11 = parameter11
        self.parameter12 = parameter12
        self.parameter13 = parameter13
        self.parameter14 = parameter14
        self.parameter15 = parameter15
        self.parameter16 = parameter16
        self.parameter17 = parameter17
        self.parameter18 = parameter18
        self.parameter19 = parameter19
        self.parameter20 = parameter20
        self.parameter21 = parameter21
        self.parameter22 = parameter22
        self.parameter23 = parameter23
        self.parameter24 = parameter24
        self.parameter25 = parameter25
        self.parameter26 = parameter26
        self.parameter27 = parameter27
        self.parameter28 = parameter28
        self.parameter29 = parameter29
        self.parameter30 = parameter30
        self.parameter31 = parameter31
        self.parameter32 = parameter32
        self.parameter33 = parameter33
        self.parameter34 = parameter34
        self.parameter35 = parameter35
        self.parameter36 = parameter36
        self.parameter37 = parameter37
        self.parameter38 = parameter38
        self.parameter39 = parameter39
        self.parameter40 = parameter40
        self.parameter41 = parameter41
        self.parameter42 = parameter42
        self.parameter43 = parameter43
        self.parameter44 = parameter44
        self.parameter45 = parameter45
        self.parameter46 = parameter46
        self.parameter47 = parameter47
        self.parameter48 = parameter48
        self.parameter49 = parameter49
        self.parameter50 = parameter50
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func map(key: String) -> InjectedValue? {
        [parameter1,parameter2,parameter3,parameter4,parameter5,parameter6,parameter7,parameter8,parameter9,parameter10,
        parameter11,parameter12,parameter13,parameter14,parameter15,parameter16,parameter17,parameter18,parameter19,parameter20,
        parameter21,parameter22,parameter23,parameter24,parameter25,parameter26,parameter27,parameter28,parameter29,parameter30,
        parameter31,parameter32,parameter33,parameter34,parameter35,parameter36,parameter37,parameter38,parameter39,parameter40,
        parameter41,parameter42,parameter43,parameter44,parameter45,parameter46,parameter47,parameter48,parameter49,parameter50]
            .compactMap { $0 }
            .first(where: {$0.id == key })
    }
    func keyPaths() -> [WritableKeyPath<InjectedState, InjectedValue>] {
        [\.parameter1,\.parameter2,\.parameter3,\.parameter4,\.parameter5,\.parameter6,\.parameter7,\.parameter8,\.parameter9,\.parameter10,
        \.parameter11,\.parameter12,\.parameter13,\.parameter14,\.parameter15,\.parameter16,\.parameter17,\.parameter18,\.parameter19,\.parameter20,
        \.parameter21,\.parameter22,\.parameter23,\.parameter24,\.parameter25,\.parameter26,\.parameter27,\.parameter28,\.parameter29,\.parameter30,
        \.parameter31,\.parameter32,\.parameter33,\.parameter34,\.parameter35,\.parameter36,\.parameter37,\.parameter38,\.parameter39,\.parameter40,
        \.parameter41,\.parameter42,\.parameter43,\.parameter44,\.parameter45,\.parameter46,\.parameter47,\.parameter48,\.parameter49,\.parameter50]
    }
    func allParameters() -> [InjectedValue] {
        [parameter1,parameter2,parameter3,parameter4,parameter5,parameter6,parameter7,parameter8,parameter9,parameter10,
                      parameter11,parameter12,parameter13,parameter14,parameter15,parameter16,parameter17,parameter18,parameter19,parameter20,
                      parameter21,parameter22,parameter23,parameter24,parameter25,parameter26,parameter27,parameter28,parameter29,parameter30,
                      parameter31,parameter32,parameter33,parameter34,parameter35,parameter36,parameter37,parameter38,parameter39,parameter40,
                      parameter41,parameter42,parameter43,parameter44,parameter45,parameter46,parameter47,parameter48,parameter49,parameter50]
    }
    func keyValue(for id: String) -> WritableKeyPath<InjectedState, InjectedValue> {
        return zip(keyPaths(), allParameters()).first(where: { $0.1.id == id })?.0 ?? \.parameter1
    }
}

extension InjectedState {
    static let empty: InjectedState = InjectedState(id: "")
}
