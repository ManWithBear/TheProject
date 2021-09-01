struct Identifier<T, Raw: Hashable>: RawRepresentable, Equatable, Hashable {
    typealias RawValue = Raw
    let rawValue: Raw
    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Identifier: Comparable where Raw: Comparable {
    static func < (lhs: Identifier<T, Raw>, rhs: Identifier<T, Raw>) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Identifier: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: rawValue)
    }
}
