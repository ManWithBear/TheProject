public struct Ingredient: Equatable, Hashable {
    public typealias RawValue = String
    public let rawValue: RawValue

    public init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Ingredient: CustomDebugStringConvertible {
    public var debugDescription: String {
        String(describing: rawValue)
    }
}
