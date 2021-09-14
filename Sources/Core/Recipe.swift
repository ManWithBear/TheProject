public struct Recipe {
    public var product: Ingredient
    public var amount: Int

    public var ingredients: [Ingredient: Int]

    public init(_ amount: Int, _ what: Ingredient, ingredients: [Ingredient: Int]) {
        self.product = what
        self.amount = amount
        self.ingredients = ingredients
    }

    /// Calculate how many recipes you need to perform to get `productNeeded` products.
    /// Always round up.
    func pessimisticRecipesPerformed(toGet productNeeded: Int) -> Int {
        guard productNeeded != 0 else { return 0 }
        let dProductNeeded = Double(productNeeded)
        let dAmount = Double(amount)
        let result = dProductNeeded / dAmount
        return Int(result.rounded(.awayFromZero))
    }

    /// Calculate how many recipes you need to perform to get `productNeeded` products.
    /// Always round down.
    func optimisticRecipesCount(toGet productNeeded: Int) -> Int {
        guard productNeeded != 0 else { return 0 }
        let dProductNeeded = Double(productNeeded)
        let dAmount = Double(amount)
        let result = dProductNeeded / dAmount
        return Int(result.rounded(.towardZero))
    }
}

extension Recipe {
    public var debugDescription: String {
        let header = "Produce \(amount) \(product) from:"
        let tail = ingredients
            .sorted { $0.key.rawValue < $1.key.rawValue }
            .map { "- \($0.value) \($0.key)" }
            .joined(separator: "\n")
        return header + "\n" + tail
    }
}
