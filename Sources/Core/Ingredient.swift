struct Ingredient: Equatable, Hashable {
    typealias RawValue = String
    let rawValue: RawValue

    init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Ingredient: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: rawValue)
    }
}
