class Project: CustomDebugStringConvertible {
    var goal: [(Ingredient.ID, amount: Int)]

    init(_ goal: [(Ingredient.ID, amount: Int)]) {
        self.goal = goal
    }

    var debugDescription: String {
        "Project:\n"
            + goal
                .map { "- \($0.amount) x \($0.0)"}
                .joined(separator: "\n")
    }
}
