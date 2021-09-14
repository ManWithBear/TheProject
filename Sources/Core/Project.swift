public struct Project {
    var goal: [(Ingredient, amount: Int)]

    public init(_ goal: [(Ingredient, amount: Int)]) {
        self.goal = goal
    }
}

extension Project: CustomDebugStringConvertible {
    public var debugDescription: String {
        "Project:\n"
            + goal
                .map { "- \($0.amount) x \($0.0)"}
                .joined(separator: "\n")
    }
}
